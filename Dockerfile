FROM python:3.8.6-slim-buster as intermediate
RUN apt-get update && apt-get install -y python3-pip && apt-get install -y default-libmysqlclient-dev
RUN mkdir /opt/app

ENV PYTHONPATH /opt/app
ENV PYTHONUNBUFFERED=1

WORKDIR /opt/app

COPY ./requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./lib_management ./

COPY ./run.sh ./run.sh

RUN chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]