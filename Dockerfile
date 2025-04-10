FROM python:3.13.2-alpine3.21

RUN apk add --no-cache python3-dev=3.12.9-r0 \
    gcc=14.2.0-r4 \
    git=2.47.2-r0 \
    musl-dev=1.2.5-r9 \
    linux-headers=6.6-r1 \
    openssh-client-common=9.9_p2-r0 \
    openssh-client-default=9.9_p2-r0 && \
    pip install --no-cache-dir --upgrade pip

COPY . /cookiecutter

WORKDIR /cookiecutter
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "cookiecutter" ]
