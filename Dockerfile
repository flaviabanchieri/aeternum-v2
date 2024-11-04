# Environemnt to install flutter and build web
FROM debian:latest AS build-env

# install all needed stuff
RUN apt-get update && \
    apt-get install -y curl git unzip

# define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.22.2
ARG APP=/app/

# clone flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK && \
    cd $FLUTTER_SDK && \
    git fetch && \
    git checkout $FLUTTER_VERSION

# setup the flutter path as an enviromental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
RUN flutter doctor -v

# create folder to copy source code
RUN mkdir $APP

# copy source code to folder
COPY . $APP

# set the working directory
WORKDIR $APP

# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub add collection:^1.18.0
RUN flutter pub get
RUN flutter build web --release --web-renderer html

# use nginx to deploy
FROM nginx:1.25.2-alpine

# copy the info of the built web app to nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html

# copy the custom nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose and run nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
