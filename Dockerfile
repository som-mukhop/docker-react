#Build Phase
FROM node:16-alpine as builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN ["npm","run","build"]

#/app/build --> will have all contents that we want to copy over from build stage to prod state

#Prod Phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html
# Need not start nginx since its default command is to start nginx server

