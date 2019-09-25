## nnUNet Docker Container (Inference)

This container takes the [nnUNet](https://github.com/hubutui/nnUNet) code and inherits from a `pytorch:pytorch` Docker image. This container is supposed to run inference only, both CPU and GPU mode for VerSe 2019 challenge. To run with GPU, you need to install and configure [nvidia-container-runtime](https://github.com/NVIDIA/nvidia-container-runtime).

## For MICCAI 2019 VerSe challenge
### Build the image

To build the docker image, you need to run this command in `nnUNet`'s parent directory:

```shell
docker docker build . -f nnUNet/docker/Dockerfile -t deepspine
```

To avoid send a large context files and directories when building docker image, you should put the whole `nnUNet` folder to an empty folder.

#### Environment-Parameters
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

### Run it

Simply run:

```shell
docker run -v datadir:/data -v modelsdir:/models -itd --rm deepspine
```

If GPU is available:

```shell
docker run --runtime=nvidia -v datadir:/data -v modelsdir:/models -itd --rm deepspine
```

change `datadir` and `modelsdir` to corresponding dir.

Our model is available at [google drive](https://drive.google.com/drive/folders/1qUeirPB6af9nB0zxfvUjMguDPI021TDp?usp=sharing), download the models and extract to `modelsdir`. By default, this docker image use entrypoint `/nnUNet/docker/run-all.sh` to run inference using ensemble of 2D U-Net, 3D low resolution U-Net, and 3D full resolution U-Net. To use the ensemble without 3D low resolution U-Net in case you got memory error due to numpy issue, you could specify option `–-entrypoint /nnUNet/docker/run.sh`.

Our docker image is available at [DockerHub](https://hub.docker.com/r/butui/deepspine). You could pull it by:

```shell
docker pull butui/deepspine
```

## For MICCAI 2019 StructSeg challenge
### build the image
For convenient, I build a base Docker image with [Dockerfile.base](Dockerfile.base), which install the necessary package for nnUNet. This base image is build from `pytorch/pytorch:0.4.1-cuda9-cudnn7-devel`. The organizer only accept CUDA 9.0, so we use this image as base. You are free to use newer version of PyTorch and CUDA if needed. To build this base image, run:

```shell
docker build -t structseg:base -f Dockerfile.base .
```

We assume you have build a base image tagged `structseg:base` from now on. Then we could build the image for each task. You should run this command in parent directory of `nnUNet`:

```shell
docker build -t structseg:USERNAME_task1 -f nnUNet/docker/Dockerfile.structseg --build-arg TASK_NAME_build=Task01_HaNOAR --build-arg FOLD_build=1 --build-arg MODELS_DIR_build=structseg-models --build-arg MODEL_build=3d_fullres .
```

Modify the `ARG` and `ENV` according to yours. For submission, I copy the trained models into the Docker image. You might consider comment out line 16 in [Dockerfile.sturctseg](Dockerfile.structseg), and simply mount the model directory to the Docker container when you run your Docker container. The `ENTRYPOINT` is required by the organizer, we run script `run-structseg.sh` in fact. And due to time and GPU memory limitation, we don't use ensemble scheme.  You might consider using ensemble to improve performance.