# all commands to run for predict
# pass to parallel for speed up
# 
# 3d_fullres
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 0 -o 3d_fullres-fold0 -z --tta 0
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 1 -o 3d_fullres-fold1 -z --tta 0
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 2 -o 3d_fullres-fold2 -z --tta 0
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 3 -o 3d_fullres-fold3 -z --tta 0
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 4 -o 3d_fullres-fold4 -z --tta 0

