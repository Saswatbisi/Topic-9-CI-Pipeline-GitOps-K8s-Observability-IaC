# Build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY shared/ ./shared/
COPY frontend/package*.json ./frontend/
COPY frontend/tsconfig.json ./frontend/
RUN npm ci --workspace=frontend
COPY frontend/ ./frontend/
RUN npm run build -w frontend

# Production stage
FROM node:18-alpine
WORKDIR /app
COPY frontend/package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/frontend/.next ./.next
COPY --from=builder /app/frontend/public ./public
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start", "-w", "frontend"]
