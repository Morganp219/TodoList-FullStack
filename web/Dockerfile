# Stage 1: Install our Node Packages
FROM node:24

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

# Stage 2: Build the Website
FROM node:24

WORKDIR /usr/src/app

COPY --from=install-deps /app/node_modules ./node_modules

COPY . .

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# This is where our main ENVs go.
RUN mkdir -p /app/public

# Update our Next.config.js to have: "output": "standalone"
RUN npm run build

# Stage 3: Run the Project
FROM node:24

WORKDIR /usr/src/app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

COPY --from=build-app /app/public ./public
COPY --from=build-app /app/.next/standalone ./
COPY --from=build-app /app/.next/static ./.next/static

EXPOSE 3000
CMD ["node", "server.js"]