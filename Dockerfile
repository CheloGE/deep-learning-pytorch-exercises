FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

LABEL author="Marcelo Garcia"

RUN apt-get update --fix-missing && apt-get install -y \
    ffmpeg \
    git \
    git-core \ 
    pkg-config \
    python3-pip \
    unzip \
    vim \
    wget \
    zip \
    zlib1g-dev

WORKDIR /project

COPY requirements.txt .

RUN pip3 install -r requirements.txt

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics