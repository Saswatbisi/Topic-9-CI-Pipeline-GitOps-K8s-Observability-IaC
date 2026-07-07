# Build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY shared/ ./shared/
COPY backend/package*.json ./backend/
COPY backend/tsconfig.json ./backend/
RUN npm ci --workspace=backend
COPY backend/src/ ./backend/src/
RUN npm run build -w backend

# Production stage
FROM node:18-alpine
WORKDIR /app
COPY backend/package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/backend/dist ./dist
ENV PORT=4000
EXPOSE 4000
CMD ["node", "dist/backend/src/index.js"]
