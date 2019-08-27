FROM ufoym/deepo:pytorch

COPY nnUNet /nnUNet
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list && \
	sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list && \
	apt update && apt install parallel -y && rm -vrf /var/lib/apt/lists/* && \
	pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
	cd nnUNet && pip install -r requirements.txt && pip install -e .

ENV INPUTDIR "/data"
ENV OUTPUTDIR "/data/results"
ENV THREADS 16
ENV JOBS 4
ENV TASK_NAME "Task19_DeepSpine"
ENV MODELS_DIR "/models"
WORKDIR "/"

ENTRYPOINT [ "/nnUNet/docker/run.sh" ]
