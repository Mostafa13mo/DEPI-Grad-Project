# Build stage
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN npm run build

# Production stage

FROM nginx:alpine

# Harden the nginx environment
RUN adduser -D -g 'front' front \
    && rm -rf /usr/share/nginx/html/*

# Copy react build
COPY --from=builder /app/build /usr/share/nginx/html

USER front

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
