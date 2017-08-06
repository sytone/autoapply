FROM jfloff/alpine-python:2.7-slim

RUN apk add --no-cache git openssh curl

ENV KUBECTL_VERSION v1.7.0
RUN curl --fail "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" > /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

COPY autoapply.py /root/autoapply.py

ENV PYTHONUNBUFFERED 1
ENTRYPOINT ["python", "/root/autoapply.py"]
