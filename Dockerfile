# Custom data science notebook for LANDER


ARG OWNER=vvcb
ARG BASE_CONTAINER=crlander.azurecr.io/vvcb/gpu-jupyter:v1.4_cuda-11.2_ubuntu-20.04
FROM $BASE_CONTAINER

LABEL maintainer="vvcb"
LABEL image="dfu-jupyterlab"

COPY ./bc_environment.yaml environment.yaml
RUN mamba env update --quiet -f environment.yaml \
    && mamba clean --all -f -y \
    && rm environment.yaml \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

USER ${NB_USER}