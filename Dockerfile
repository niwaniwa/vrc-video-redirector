FROM golang:1.18.3-alpine3.16

RUN apk update && apk add git

ENV ROOT=/go/src/app
ENV LIBRARY=${ROOT}/lib/
WORKDIR ${ROOT}

WORKDIR ${ROOT}

ADD . ${ROOT}

RUN go mod tidy

RUN mkdir ${LIBRARY}

RUN wget -P ${LIBRARY} https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp

#CMD ["go", "run", "*.go", "--port 8000", "--url-root /path/to/vvr/", "--ytdlp-path \\go\\src\\app\\lib\\yt-dlp"]
# RUN go run *.go --port 8000 --url-root /path/to/vvr/ --ytdlp-path ${LIBRARY}/yt-dlp
