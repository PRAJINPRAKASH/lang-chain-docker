FROM python:3.10-slim

WORKDIR /python-docker

RUN apt-get update &&\
    apt-get install --no-install-recommends --yes build-essential\
     git libmagic-dev \
     poppler-utils libreoffice pandoc \
     tesseract-ocr libxml2 libxslt-dev

ENV PYTHONUNBUFFERED 1

COPY requirements/unstructured.txt requirements/unstructured.txt

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements/unstructured.txt

COPY requirements/detectron2.txt requirements/detectron2.txt

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements/detectron2.txt

COPY requirements/langchain.txt requirements/langchain.txt

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements/langchain.txt

COPY requirements/additional.txt requirements/additional.txt

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements/additional.txt