FROM golang:alpine AS builder
ENV CGO_ENABLED=0
RUN apk add --no-cache git ca-certificates tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
RUN git clone --depth=1 https://github.com/xqdoo00o/ChatGPT-to-API.git /cta
RUN cd /cta && git reset --hard c4f8a420e40a5ff434d9f8a9b91803155a0c97c5
RUN cd /cta && go build

FROM scratch
ENV GIN_MODE=release
WORKDIR /cta
COPY --from=builder /cta/freechatgpt .
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/localtime /etc/localtime
COPY --from=builder /etc/timezone /etc/timezone
COPY api_keys.txt .
CMD [ "./freechatgpt" ]
