FROM kaixhin/cuda-caffe:8.0
MAINTAINER Socratic Datum <socratic.datum@gmail.com>

# Move to root and clone PPGN repo 
RUN cd /root/ && git clone https://github.com/Evolving-AI-Lab/ppgn.git

# Clone the caffe_lrcn repo for image captioning (example 5)
RUN cd /root/ && git clone https://github.com/anguyen8/caffe_lrcn.git

# Move into models folder and download
RUN cd /root/ppgn/nets/generator/noiseless && ./download.sh
RUN cd /root/ppgn/nets/caffenet && ./download.sh
RUN cd /root/ppgn/nets/placesCNN && ./download.sh
RUN cd /root/ppgn/nets/lrcn && ./download.sh

# Update packages and install image magic for command-line interfacees
RUN apt-get update && apt-get -y install imagemagick

# Install nano
RUN apt-get update && apt-get -y install nano

# Install virtualenv
RUN pip install virtualenv

# Create a Python 3 environment in the ppgn directory
RUN cd /root/ppgn && virtualenv -p python3 env

# Edit file path for caffe/python
RUN cd /root/ppgn && sed -i "s|/path/to/your/caffe/python|~/caffe/python |g" settings.py
