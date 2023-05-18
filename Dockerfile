FROM python:3.10-slim

WORKDIR /python-docker

RUN apt-get update &&\
    apt-get install --no-install-recommends --yes build-essential
RUN apt-get install -y git libmagic-dev \
     poppler-utils libreoffice pandoc \
     tesseract-ocr libxml2 libxslt-dev

ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements.txt

COPY requirements2.txt .

RUN --mount=type=cache,target=/root/.cache \
    pip install -r requirements2.txt