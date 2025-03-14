FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /app

COPY requirements.txt /app/

RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY app/ .

EXPOSE 5000

CMD ["python3", "simple_app.py"]