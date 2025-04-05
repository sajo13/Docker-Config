
FROM node:20-alpine AS builder

WORKDIR /build


COPY package*.json ./

RUN npm install


COPY . .
RUN npm run build


FROM node:20-alpine AS runner


RUN npm install -g serve

WORKDIR /app


COPY --from=builder /build/dist ./dist

EXPOSE 3000

CMD ["serve", "-s", "dist"]
