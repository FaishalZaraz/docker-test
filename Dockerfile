# Stage 1: Build
FROM node:16 AS build

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json untuk instalasi dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy semua file aplikasi ke dalam container
COPY . .

# Stage 2: Runtime
FROM node:16-alpine

# Create non-root user and group
RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

# Set working directory
WORKDIR /app

# Copy file aplikasi dari stage build
COPY --from=build /app /app

# Change ownership of the working directory to non-root user
RUN chown -R nonroot:nonroot /app

# Switch to non-root user
USER nonroot

# Expose port yang digunakan oleh aplikasi Node.js
EXPOSE 3000

# Jalankan aplikasi
CMD ["node", "index.js"]
