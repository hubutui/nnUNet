#!/bin/bash
#
# rename input images
python /nnUNet/docker/rename-images.py --inputdir /input --outputdir /tmpdir

echo '==============================='
echo 'Run nnUnet Prediction'
echo '==============================='
# predict
OMP_NUM_THREADS=1 RESULTS_FOLDER=/models python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m $MODEL -f $FOLD -o /tmpdir-result --tta 0
rm -vf /tmpdir-result/*.pkl
# rename predict
echo "saving result..."
python /nnUNet/docker/rename-seg.py --inputdir /tmpdir-result --outputdir /output
