# Use the latest Jupyter Scipy notebook image from quay.io
FROM quay.io/jupyter/scipy-notebook:latest

LABEL author="Sumi Lee"
LABEL description="Modified container definition for class competition."

# Create app directory
WORKDIR /app

RUN pip install -U graphviz==0.16 \
    "ipython>=7.20.0,<8" \
    notebook==6.4.6 \
    jupyter-client==7.1.2 \
    jupyter-contrib-nbextensions==0.5.1 \
    && jupyter contrib nbextension install --user

# copy executables to path
COPY . ./
RUN chmod u+x  scripts/* \
    && mv scripts/* /usr/local/bin/ \
    && rmdir scripts

# launch jupyter by default
CMD ["/bin/bash", "launch-notebook"]
