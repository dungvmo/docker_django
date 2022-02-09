FROM python:3.8.6-slim-buster as intermediate
RUN apt-get update && apt-get install -y python3-pip
RUN mkdir /opt/app
COPY ./lib_management /opt/app
WORKDIR /opt/app/lib_management
ENV PYTHONPATH /opt/app/lib_management
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py migrate
CMD ["python", "manage.py", "runserver"]

