# 1. Use official Node.js image
FROM node:18

# 2. Create app directory inside container
WORKDIR /app

# 3. Copy package.json first (for caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy rest of the application code
COPY . .

# 6. Expose port 3000
EXPOSE 3000

# 7. Run the application
CMD ["node", "app.js"]
