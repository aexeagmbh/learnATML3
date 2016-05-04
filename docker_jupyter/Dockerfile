FROM jupyter/notebook:latest
RUN apt-get update -y && apt-get install -y python3-pip && pip3 install jupyter
CMD docker run --rm -it -p 8888:8888 -v "$(pwd):/notebooks" jupyter/notebook
