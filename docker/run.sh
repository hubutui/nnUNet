#!/bin/bash

python /nnUNet/docker/rename_input.py

echo '==============================='
echo 'Run nnUnet Prediction'
echo '==============================='
# Change the call according to your parameters.
mkdir -p 3d_fullres-fold0 3d_fullres-fold1 3d_fullres-fold2 3d_fullres-fold3 3d_fullres-fold4
# predict
#parallel -j $JOBS < /nnUNet/docker/predict-commands.sh
bash /nnUNet/docker/predict-commands.sh
# ensemble
mkdir -p $OUTPUTDIR
python /nnUNet/nnunet/inference/ensemble_predictions.py -t $THREADS -o $OUTPUTDIR -f 3d_fullres-fold0 3d_fullres-fold1 3d_fullres-fold2 3d_fullres-fold3 3d_fullres-fold4 
