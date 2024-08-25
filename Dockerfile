FROM docker.n8n.io/n8nio/n8n:latest

# Usar usuário root para instalar pacotes
USER root
WORKDIR /data

# Instalar a versão mais atual do Python e as dependências necessárias
RUN apk add --update --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    build-base \
    libffi-dev \
    openssl-dev

# Criar um ambiente virtual
RUN python3 -m venv /data/venv

# Ativar o ambiente virtual e instalar pacotes Python organizadamente usando pip3
COPY requirements.txt .
RUN . /data/venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Voltar para o usuário n8n após instalação
USER node

# Configurações adicionais para o n8n

