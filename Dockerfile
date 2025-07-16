FROM registry.gitlab.com/onelink-big-data-infrastructure/dev-ops/container-images/pyspark:BRANCH_main_1a21bb92
ENV HOME=/opt/spark/work-dir
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERRED=1
ENV UV_LINK_MODE=copy
ENV UV_NO_CACHE=1

USER root

RUN apt update && apt install -y \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && apt install -y \
    python3.10 python3.10-venv python3.10-dev

RUN pip install --no-cache-dir "uv==0.7.*"

RUN mkdir -p /home/spark/.cache/uv && chown -R 185:185 /home/spark

RUN apt update && apt install -y gettext

USER 185
WORKDIR /opt/spark/work-dir
ENV HOME=/opt/spark/work-dir

COPY --chown=185:185 pyproject.toml .
RUN uv venv --python=/usr/bin/python3.10 && uv sync

COPY --chown=185:185 . .

ENV PYSPARK_PYTHON=/opt/spark/work-dir/.venv/bin/python
