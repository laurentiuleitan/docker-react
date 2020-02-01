# BUILD phase

FROM node:alpine as builder

# Set proxy - must be done when running from the Conti nw
ENV http_proxy "http://uidt589z:Windows2000@cias3basic.conti.de:8080"
ENV https_proxy "http://uidt589z:Windows2000@cias3basic.conti.de:8080"

WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build


# RUN phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
