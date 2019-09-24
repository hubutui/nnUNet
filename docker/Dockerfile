FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel

COPY nnUNet /nnUNet
RUN	apt update && DEBIAN_FRONTEND=noninteractive apt install parallel -y && rm -vrf /var/lib/apt/lists/* 
RUN	cd /nnUNet && pip install -r requirements.txt && pip install -e .

ENV INPUTDIR "/data"
ENV OUTPUTDIR "/data/results"
ENV THREADS 16
ENV JOBS 4
ENV TASK_NAME "Task19_DeepSpine"
ENV MODELS_DIR "/models"
WORKDIR "/"

ENTRYPOINT [ "/nnUNet/docker/run.sh" ]
