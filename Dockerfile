FROM python:3.9-alpine3.13
LABEL maintainer="Adam"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /appEXPOSE 8000


RUN python -m venv /pa && \
    /py/bin/pip install --upgrade pip &&\
    /py/bin/pip install -r /tmp/requirements.txt &&\
    rw -rf /tmp &&\
    adduser \
        --disabled-password \
        --no-create-home \
    django-user
ENV PATH="/py/bin:$PATH"

USER django-user
