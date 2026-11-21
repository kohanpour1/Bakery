FROM node:22-bookworm-slim
WORKDIR /app
# better-sqlite3 may need native compilation when a prebuilt binary is unavailable.
RUN apt-get update && apt-get install -y --no-install-recommends python3 make g++ && rm -rf /var/lib/apt/lists/*
COPY package.json ./
RUN npm install --omit=dev --no-audit --no-fund
COPY . .
ENV NODE_ENV=production PORT=3000 HOST=0.0.0.0 BASE_PATH=/ 
EXPOSE 3000
CMD ["npm","start"]
