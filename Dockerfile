FROM kaixhin/cuda-caffe:8.0
MAINTAINER Socratic Datum <socratic.datum@gmail.com>

# Clone PPGN repo 
RUN git clone https://github.com/Evolving-AI-Lab/ppgn.git

# Move into models folder and download
RUN cd ppgn/nets/generator/noiseless && ./download.sh
RUN cd ppgn/nets/caffenet && ./download.sh
RUN cd ppgn/nets/placesCNN && ./download.sh
# Image captioning model might require different version of caffe
RUN cd ppgn/nets/lrcn && ./download.sh

# Update packages and install image magic for command-line interfacees
RUN apt-get update && apt-get -y install imagemagick
