FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN chmod +x docker-entrypoint.sh
USER node
EXPOSE 8888
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["node", "server.js"]
