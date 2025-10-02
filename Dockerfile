FROM golang:1.20 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o main .

FROM debian:latest

WORKDIR /usr/app

COPY --from=build /usr/src/app/main .

ENTRYPOINT [ "/usr/app/main" ]