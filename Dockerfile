FROM hugomods/hugo:exts-0.123.7 AS build
WORKDIR /src
COPY . .
RUN hugo --minify

FROM nginx:alpine-slim
RUN apk upgrade --no-cache
COPY --from=build /src/public /usr/share/nginx/html
