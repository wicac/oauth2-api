FROM alpine:latest
MAINTAINER wicac@yahoo.com

RUN apk update && apk add tar gzip
RUN apk add --update nodejs

RUN mkdir -p /apps/oauth2-api/views
RUN mkdir -p /apps/oauth2-api/quotes

WORKDIR /apps/oauth2-api

COPY views /apps/oauth2-api/views
COPY quotes /apps/oauth2-api/quotes

COPY package.json .
COPY app.js .
COPY model.js .
COPY routes.js .
COPY .env .

RUN npm install --save express
RUN npm install --save express-session
RUN npm install --save mongojs
RUN npm install --save body-parser
RUN npm install --save cookie-parser
RUN npm install --save oauth2-server
RUN npm install --save dotenv

ENTRYPOINT ["node"]
CMD ["app.js"]
