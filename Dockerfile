FROM ubuntu

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
        python-pip \
        wget \
        zip \
        gfortran

RUN pip install \
    numpy \
    requests \
    https://github.com/modflowpy/pymake/zipball/master

RUN wget https://github.com/modflowpy/pymake/archive/master.zip \
    && unzip master.zip \ 
    && cd pymake-master/examples 
    && python make_mfnwt.py 
    && cd temp 
    && mv mfnwt /usr/bin/
