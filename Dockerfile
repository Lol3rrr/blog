FROM node:lts-alpine as builder

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade

# copy the app, note .dockerignore
COPY . /usr/src/nuxt-app/
RUN npm install

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN npm run build

# expose 5000 on container
EXPOSE 80

RUN npm run-script generate


FROM lol3r/c-http-server:latest

WORKDIR /root/http-server

COPY --from=builder /usr/src/nuxt-app/dist/ website/

# start the app
ENTRYPOINT ["./server.out", "-ic", "-c"]
