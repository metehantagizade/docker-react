FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# result inside build folder will be placed inside /app/build of container



FROM nginx
#Copy files from /app/build of builder container to this container to /usr/share/nginx/html folder
COPY --from=builder /app/build /usr/share/nginx/html

#The default command of the enginx container is "start nginx" so there is no need to write that