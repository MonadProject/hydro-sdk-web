FROM node:11.10.0 AS build

ARG REACT_APP_API_ADDRESS
ARG REACT_APP_WS_ADDRESS
ARG REACT_APP_HYDRO_PROXY_ADDRESS
ARG REACT_APP_HOT_CONTRACT_ADDRESS

RUN mkdir -p /app/starter-kit-web
WORKDIR /app/starter-kit-web

COPY . /app/starter-kit-web
RUN yarn install
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/starter-kit-web/build /usr/share/nginx/html
