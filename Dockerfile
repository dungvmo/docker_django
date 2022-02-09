FROM python:3.8.6-slim-buster as intermediate
RUN apt-get update && apt-get install -y \
    python3-pip \
RUN mkdir /opt/app
WORKDIR /opt/app
ENV PYTHONPATH /opt/app
COPY ./lib_management/requirements.txt ./requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py migrate
CMD ["python", "manage.py", "runserver"]

