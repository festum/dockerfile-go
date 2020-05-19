FROM golang:1

# Install must have
RUN apt-get update && apt-get install -y build-essential git curl python3-pip
RUN go get github.com/golang-migrate/migrate
RUN go get github.com/fullstorydev/grpcurl
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin latest
RUN pip3 install black pytest

RUN go version
RUN golangci-lint --version
RUN pip3 --version
