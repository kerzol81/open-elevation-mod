FROM ghcr.io/osgeo/gdal:ubuntu-full-latest-amd64

RUN apt-get update
RUN apt-get install -y libspatialindex-dev unar bc wget mc nano net-tools unar

# KZ mod 2024.07.09

WORKDIR /code
RUN mkdir -p /code
RUN mkdir -p /code/data
ENV TZ=Hungary/Budapest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# OS dependencies
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf

RUN \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get install -y \
    libspatialindex-dev unar bc python3-pip wget libgdal-dev gdal-bin

# Python dependencies
ADD ./requirements.txt .
RUN pip install -r requirements.txt


ADD . /code/


CMD python3 server.py

EXPOSE 8080

EXPOSE 8443
