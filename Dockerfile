FROM nvcr.io/nvidia/pytorch:24.01-py3
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/
RUN pip install "unsloth[colab-new] @ git+https://github.com/unslothai/unsloth.git"
RUN pip install --no-deps xformers
RUN pip install -e .[metrics,bitsandbytes,qwen]
VOLUME [ "/root/.cache/huggingface/", "/app/data", "/app/output", "/app/config" ]
EXPOSE 7860
CMD [ "llamafactory-cli", "webui" ]