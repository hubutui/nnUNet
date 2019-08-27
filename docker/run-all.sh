#!/bin/bash

python /nnUNet/docker/rename_input.py

echo '==============================='
echo 'Run nnUnet Prediction'
echo '==============================='
# Change the call according to your parameters.
mkdir -p 2d-fold0 2d-fold1 2d-fold2 2d-fold3 2d-fold4
mkdir -p 3d_fullres-fold0 3d_fullres-fold1 3d_fullres-fold2 3d_fullres-fold3 3d_fullres-fold4
mkdir -p 3d_lowres-fold0 3d_lowres-fold1 3d_lowres-fold2 3d_lowres-fold3 3d_lowres-fold4
# predict
parallel -j $JOBS < /nnUNet/docker/predict-commands-all.sh
# ensemble
python /nnUNet/nnunet/inference/ensemble_predictions.py -t $THREADS -o $OUTPUTDIR -f 2d-fold0 2d-fold1 2d-fold2 2d-fold3 2d-fold4 3d_fullres-fold0 3d_fullres-fold1 3d_fullres-fold2 3d_fullres-fold3 3d_fullres-fold4 3d_lowres-fold0 3d_lowres-fold1 3d_lowres-fold2 3d_lowres-fold3 3d_lowres-fold4
