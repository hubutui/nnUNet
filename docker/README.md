## nnUNet Docker Container (Inference)

This container takes the [MIC-DKFZ/nnUNet](https://github.com/MIC-DKFZ/nnUNet) code and inherits from a `ufoym/deepo:pytorch` Docker image. This container is supposed to run inference only, both CPU and GPU mode for VerSe 2019 challenge. To run with GPU, you need to install and configure [nvidia-container-runtime](https://github.com/NVIDIA/nvidia-container-runtime).

## Build the image

To build the docker image, you need to run this command in `nnUNet`'s parent directory:

```shell
docker docker build . -f nnUNet/docker/Dockerfile -t deepspine
```

To avoid send a large context files and directories when building docker image, you should put the whole `nnUNet` folder to an empty folder.

### Environment-Parameters
> - `INPUTDIR`: dir path to the input folder containing the compressed nifti files (nii.gz):
> ```
> /data/
>  - imageA.nii.gz
>  - imageB.nii.gz
> ```
> The nifti files are renamed by the container, so you don't have to rename them before.
>
> - `OUTPUTDIR`: dir path to the output folder containing all final segmentations which were calculated during the container process, which is set to `/data/results` by default.

> - `MODELS_DIR`: this is very important to make right, because here you have to mount a directory containing your model dir tree starting from the 'nnUNet'-folder
> Example: `\opt\path\data\nnUNet` is the correct path when your model lives here: `\opt\path\data\nnUNet\3d_fullres\Task19_DeepSpine\nnUNetTrainer__nnUNetPlans`. Actually, this is the `RESULTS_FOLDER` when you run nnUNet training.

> - `TASK_NAME`: this name should match the task name you used for training the model. The task name appears also within the RESULTS_FOLDER variable, which is set to `Task19_DeepSpine`.
> - `THREADS`: how many threads used to processing nift files, set to 16 by default, set to a smaller one if you run out of memory.
> - `JOBS`: how many jobs to run parallel, set to 4 by default, set to smaller one if you run out of GPU memory.

___
You may want to change data loading or output structuring. This shows an example for VerSe 2019 challenge.

## Run it

Simply run:

```shell
docker run -v datadir:/data -v modelsdir:/models -itd --rm deepspine
```

If GPU is available:

```shel
docker run --runtime=nvidia -v datadir:/data -v modelsdir:/models -itd --rm deepspine
```

change `datadir` and `modelsdir` to corresponding dir.