# pull official base image
FROM python:3.8

# accept arguments
ARG PIP_REQUIREMENTS=dev.txt

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip setuptools

# create user for the Django project
#RUN useradd -ms /bin/bash myproject

# set current user
#USER myproject

RUN mkdir /store

# set work directory
WORKDIR /store

# create and activate virtual environment
#RUN python -m venv env


# copy and install pip requirements store/src/requirements/${PIP_REQUIREMENTS}
COPY src/requirements/  store/src/requirements/

RUN pip install -r store/src/requirements/dev.txt
#RUN ./env/bin/pip3 install -r  store/src/requirements/_base.txt
#RUN ./env/bin/pip3 install -r  store/src/requirements/${PIP_REQUIREMENTS}

# copy Django project files

COPY . .
