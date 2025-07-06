FROM python:3.12
ENV PIP_NO_CACHE_DIR=off 

COPY src/ .
COPY requirements.txt .
COPY run_docker.sh .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["./run_docker.sh"]

