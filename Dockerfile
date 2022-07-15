FROM node:18-alpine3.15 as builder

# install dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

# Copy all local files into the image.
COPY . .

CMD ["npm","start"]
