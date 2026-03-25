# Stage 1: Install dependencies
FROM node:24 AS install-deps

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install


# Stage 2: Build the app
FROM node:24 AS build-app

WORKDIR /usr/src/app

COPY --from=install-deps /usr/src/app/node_modules ./node_modules
COPY . .

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# IMPORTANT: ensures standalone output is generated
RUN npm run build


# Stage 3: Run the app
FROM node:24 AS runner

WORKDIR /usr/src/app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

COPY --from=build-app /usr/src/app/public ./public
COPY --from=build-app /usr/src/app/.next/standalone ./
COPY --from=build-app /usr/src/app/.next/static ./.next/static

EXPOSE 3000

CMD ["node", "server.js"]