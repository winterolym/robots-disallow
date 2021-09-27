FROM --platform=linux/arm64/v8 golang:1.17.1-alpine

LABEL org.label-schema.vcs-url="https://github.com/wikiwi/robots-disallow" \
      org.label-schema.vendor=wikiwi.io \
      org.label-schema.name=robots-disallow \
      io.wikiwi.license=MIT

RUN apk add --no-cache \
    git \
    openssh-client

WORKDIR /go/src/app

COPY . /go/src/app
RUN go get -v && \
    go install

ENTRYPOINT ["app"]
