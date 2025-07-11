FROM python:3.12-slim

WORKDIR /home/immich-tiktok-remover

ENV PIP_NO_CACHE_DIR=off 

ARG USERNAME=immich-tiktok-remover
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the immich-tiktok-remover user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER $USERNAME

COPY src/ .
COPY requirements.txt .
COPY run_docker.sh .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["./run_docker.sh"]

