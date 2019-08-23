FROM node:8
LABEL maintainer="Sinan Turgut <mail@sinanturgut.com.tr>"
WORKDIR /usr/src/app

RUN git clone https://github.com/onuragtas/redis-commander.git
WORKDIR /usr/src/app/redis-commander
RUN npm install -verbose

CMD ["bin/redis-commander.js"]