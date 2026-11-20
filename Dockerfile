FROM node:22-bookworm-slim
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
ENV NODE_ENV=production PORT=3000 BASE_PATH=/ SESSION_SECRET=replace-this
EXPOSE 3000
CMD ["node","server.js"]
