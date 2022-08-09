FROM  ubuntu/nginx

RUN mkdir /opt/file-manager
RUN apt update
RUN apt install nodejs npm -y


ENV KEY=5cuwiz2vyehnttceoox5xmbjxdjzgun5


COPY ./entrypoint /opt/file-manager/entrypoint
COPY ./file-manager /opt/file-manager
COPY ./www /opt/work
COPY ./nginx.conf /etc/nginx/sites-enabled/default


# COPY . /usr/local/share/file-manager
RUN cd /opt/file-manager \
	&& npm install . \
	&& rm -rf ~/.npm ~/.cache

WORKDIR /opt/work

# CMD ["node", "/opt/file-manager/index.js"]

EXPOSE 80 8080

ENTRYPOINT [ "/opt/file-manager/entrypoint" ]