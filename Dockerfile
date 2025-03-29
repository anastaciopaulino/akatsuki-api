FROM python:3.12-alpine3.21

LABEL maintainer="anastaciopaulino.github.io"

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./akastuki ./akastuki
WORKDIR /akastuki

EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        anastacio

ENV PATH="/py/bin:$PATH"

USER anastacio