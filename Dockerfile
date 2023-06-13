FROM ubuntu:20.04

# Update package repositories and install dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata. 
RUN apt install -y git wget curl python3-pip python3 ffmpeg sudo ssh vim fastjar

# Add a new user
RUN useradd -ms /bin/bash user && \
    echo "user:password" | chpasswd && \
    adduser user sudo


# Install Anaconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.3.1-0-Linux-x86_64.sh && \
    bash Miniconda3-py38_23.3.1-0-Linux-x86_64.sh -b -u -p /opt/anaconda && \
    rm Miniconda3-py38_23.3.1-0-Linux-x86_64.sh

# Set up Anaconda environment
ENV PATH /opt/anaconda/bin:$PATH

# Create the Conda environment for DeepFaceLab
ADD environment.yml /
RUN conda env create -f /environment.yml

# Activate the Conda environment
RUN echo "source activate deepfacelab" >> ~/.bashrc
ENV PATH /opt/anaconda/envs/deepfacelab/bin:$PATH

WORKDIR /home/user
RUN git clone --depth 1 https://github.com/infinitygorkem/DeepFaceLab_Linux.git
WORKDIR /home/user/DeepFaceLab_Linux
RUN mkdir DeepFaceLab && cd DeepFaceLab && git clone --depth 1 -b DFL https://github.com/infinitygorkem/DeepFaceLab_Linux.git DeepFaceLab

ADD env.sh /home/user 
RUN cp -f /home/user/env.sh /home/user/DeepFaceLab_Linux/scripts/env.sh
RUN apt-get install libsm6 libxrender1 libfontconfig2

# VOLUME /home/user/DeepFaceLab_Linux/


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
