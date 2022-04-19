FROM ubuntu:20.04
RUN export node_version="16.14.2" \
&& apt-get update && apt-get -y install nodejs="$node_version" --no-install-recommends -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN npm install express@4.17.3
EXPOSE 9000
CMD ["npm", "start"]