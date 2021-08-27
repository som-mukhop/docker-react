FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json /app

RUN npm install -g npm@7.21.0
RUN npm install express 


COPY . . 

RUN npm run build



FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

