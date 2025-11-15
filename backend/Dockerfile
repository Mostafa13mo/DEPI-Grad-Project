# Build stage
FROM node:20-alpine AS builder

# Create non-root user for security
RUN addgroup -S app && adduser -S app -G app

WORKDIR /app

# Install only production deps
COPY package*.json ./
RUN npm ci --omit=dev

# Copy source
COPY . .

# Production Stage

FROM node:20-alpine

# Security hardening
RUN addgroup -S app && adduser -S app -G app \
    && apk --no-cache add dumb-init

WORKDIR /app

# Copy built app
COPY --from=builder /app /app
USER app

EXPOSE 5000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["node", "server.js"]
