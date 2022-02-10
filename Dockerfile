FROM python:3.8.6-slim-buster as intermediate
RUN apt-get update && apt-get install -y python3-pip && apt-get install -y default-libmysqlclient-dev
RUN mkdir /opt/app

ENV PYTHONPATH /opt/app
ENV PYTHONUNBUFFERED=1

WORKDIR /opt/app

COPY ./lib_management/requirements.txt ./requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY ./lib_management ./

COPY ./run.sh ./run.sh

RUN chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]