FROM docker.io/node:lts-alpine as builder

# install dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --production

FROM alpine as production

COPY --from=builder /usr/local/bin/node /usr/local/bin/
COPY --from=builder /usr/lib/ /usr/lib/

WORKDIR /app
COPY --from=builder /app/node_modules node_modules
COPY auth.json ./
COPY app.js ./

CMD ["/usr/local/bin/node","app.js"]
