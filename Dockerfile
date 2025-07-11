FROM python:3.12-slim

ARG USERNAME=immich-tiktok-remover
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the immich-tiktok-remover user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER $USERNAME

# Non-sudo user can only write to their home
WORKDIR /home/immich-tiktok-remover

# Fixing permissions on the slim base image
RUN mkdir /home/immich-tiktok-remover/.local

# Globally turn off pip3 cache to reduce file size
ENV PIP_NO_CACHE_DIR=off 

# Add required files
COPY src/ .
COPY requirements.txt .
COPY run_docker.sh .

# Generate software bill of materials to verify packages
RUN pip3 install cyclonedx-bom
RUN python3 -m cyclonedx_py requirements requirements-sbom.txt

# Install dependancies for the TikTok remover
RUN pip3 install --no-cache-dir -r requirements.txt

# Run main tool
CMD ["./run_docker.sh"]

