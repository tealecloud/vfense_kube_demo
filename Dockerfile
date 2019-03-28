FROM golang:1.11-alpine

#install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh build-base gcc sqlite

# Copy the local package files to the container's workspace.
RUN mkdir -p /app/src/go_vfense
WORKDIR /app/src/go_vfense
ADD . .

#copies the Gopkg.toml and Gopkg.lock to WORKDIR

# Install dependencies
ENV GO111MODULE=on
RUN go mod download

RUN go install go_vfense

RUN env

RUN ls -l /go/bin
RUN ls -l /app/src/go_vfense

# Run program
ENTRYPOINT ["/go/bin/go_vfense"]

# Document that the service listens on port 8000
EXPOSE 8000
