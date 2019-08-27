# all commands to run for predict
# pass to parallel for speed up
# 
# 2d
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 2d -f 0 -o 2d-fold0 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 2d -f 1 -o 2d-fold1 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 2d -f 2 -o 2d-fold2 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 2d -f 3 -o 2d-fold3 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 2d -f 4 -o 2d-fold4 -z

# 3d_fullres
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 0 -o 3d_fullres-fold0 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 1 -o 3d_fullres-fold1 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 2 -o 3d_fullres-fold2 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 3 -o 3d_fullres-fold3 -z
OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_fullres -f 4 -o 3d_fullres-fold4 -z

# 3d_lowres
#OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_lowres -f 0 -o 3d_lowres-fold0
#OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_lowres -f 1 -o 3d_lowres-fold1
#OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_lowres -f 2 -o 3d_lowres-fold2
#OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_lowres -f 3 -o 3d_lowres-fold3
#OMP_NUM_THREADS=1 RESULTS_FOLDER=$MODELS_DIR python nnUNet/nnunet/inference/predict_simple.py -i /tmpdir -t $TASK_NAME -tr nnUNetTrainer --num_threads_preprocessing $THREADS --num_threads_nifti_save $THREADS -m 3d_lowres -f 4 -o 3d_lowres-fold4
