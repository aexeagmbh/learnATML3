FROM docker_python:latest
RUN pip3 install jupyter
CMD docker run --rm -it -p 8888:8888 -v "$(pwd):/notebooks" jupyter/notebook
