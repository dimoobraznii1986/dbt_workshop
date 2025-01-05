# Top level build args
ARG build_for=linux/amd64

# Base image
FROM python:3.11.6-slim-bullseye as base

# Install necessary Linux dependencies
RUN apt-get update && apt-get install -y \
  python3-dev \
  git \
  g++ \
  sasl2-bin \
  libsasl2-2 \
  libsasl2-dev \
  libsasl2-modules \
  make \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/app/dbt/
VOLUME /usr/app

# Set up Python virtual environment
RUN python -m venv venv

# Install dependencies from requirements.txt
COPY ./requirements.txt ./
RUN . venv/bin/activate && pip install -r requirements.txt

# Copy profiles.yml for DBT configuration
COPY ./profiles.yml /usr/app/dbt/profiles.yml

# Copy all DBT files into the container
COPY . .

# Install DBT dependencies (e.g., DBT packages, adapters)
RUN . venv/bin/activate && dbt deps

# Ensure proper environment variables are set for DBT commands (if needed)
ENV DBT_USER=${DBT_USER}
ENV DBT_PASSWORD=${DBT_PASSWORD}
ENV DBT_HOST=${DBT_HOST}
ENV DBT_DATABASE=${DBT_DATABASE}

# DBT command to initialize and build models
RUN . venv/bin/activate && dbt run --target dev  # Change 'dev' to your target if needed