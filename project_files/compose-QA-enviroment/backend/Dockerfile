FROM golang AS base

FROM base AS builder

WORKDIR /app
COPY . .
RUN go mod tidy && go build -o myapp

FROM ubuntu AS runner

WORKDIR /app

COPY --from=builder /app/myapp .

CMD ["./myapp"]
