# Top level build args
ARG build_for=linux/amd64

# Base image
FROM python:3.11.6-slim-bullseye as base

# Linux Dependencies
RUN apt-get update && apt-get install -y \
  python3-dev \
  git \
  g++ \
  sasl2-bin \
  libsasl2-2 \
  libsasl2-dev \
  libsasl2-modules \
  make \
  curl

# Set docker basics
WORKDIR /usr/app/dbt/
VOLUME /usr/app

RUN python -m venv venv
RUN . venv/bin/activate

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

COPY ./profiles.yml /usr/app/dbt/profiles.yml
COPY . .

RUN dbt deps
