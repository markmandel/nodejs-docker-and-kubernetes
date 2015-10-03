FROM debian:jessie

RUN apt-get update && apt-get -y install wget curl less unzip python zsh git make openssh-server
WORKDIR /

#sshd setup - https://docs.docker.com/examples/running_ssh_service/
RUN mkdir /var/run/sshd
RUN echo 'root:pw' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

#install cloud sdk
RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip -q google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN /google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/root/.bashrc
ENV PATH /google-cloud-sdk/bin:$PATH

RUN gcloud components update --quiet

#install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install --yes nodejs

WORKDIR /root

#oh-my-zsh, because how do we live without it?
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git

ADD startup.sh startup.sh
RUN chmod +x startup.sh

RUN mkdir /project
WORKDIR /project

#Web ports
EXPOSE 8080-8090