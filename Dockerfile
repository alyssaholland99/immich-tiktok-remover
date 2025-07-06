FROM python:3.12

COPY src/ .
COPY requirements.txt .
COPY run_1hr.sh .

RUN pip3 install -r requirements.txt

CMD ["./run_1hr.sh"]

