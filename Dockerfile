FROM alpine:latest 
RUN apk add --no-cache libc6-compat

RUN mkdir /app
RUN mkdir /app/data
COPY main /app/main
COPY data/* /app/data/

WORKDIR /app

EXPOSE 8080
CMD ["./main"]
CMD ["tail", "-f", "/dev/null"]