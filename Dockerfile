FROM python:3.9-alpine

COPY requirements.txt .

RUN apk add --no-cache build-base \
 && pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt \
 && apk del build-base

COPY main.py .

# Expose is NOT supported by Heroku
# EXPOSE 8000

# $PORT is set by Heroku
CMD uvicorn main:app --host=0.0.0.0 --port $PORT