FROM docker.io/node:14-alpine as builder

# install dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --production

# Copy all local files into the image.
FROM docker.io/mhart/alpine-node:slim-14 as deployment

WORKDIR /app
COPY --from=builder /app/node_modules node_modules
COPY auth.json .
COPY app.js .

CMD ["node","app.js"]
