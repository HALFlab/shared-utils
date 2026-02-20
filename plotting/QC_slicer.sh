#!/usr/bin/env bash
# Ula Briski

set -euo pipefail

ROOT="/Users/ulabriski/Desktop/Dolphin_data/final_dolphin/T1_HF"  # change to point to your directory
OUT="${ROOT}/QC_png"                                              # define output directory
mkdir -p "$OUT"

shopt -s nullglob   # just here to avoid errors if no files match the wildcard later on

# loop through subjects
for subdir in "$ROOT"/*/; do       
  subj="$(basename "$subdir")"   

  # Find nii.gz files in subject folder
  niftis=("$subdir"/*.nii.gz)

  nii="${niftis[0]}"
  out_png="${OUT}/${subj}.png"
  slicer "$nii" -a "$out_png"

  echo "Created: $out_png"
done

echo "Done."