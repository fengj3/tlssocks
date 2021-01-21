#!/bin/bash
compiler() {
  CGO_ENABLED=0 GOOS=$1 GOARCH=$2 go build -o bin/tlssocks-${1}-${2} cmd/tlssocks/tlssocks.go
  CGO_ENABLED=0 GOOS=$1 GOARCH=$2 go build -o bin/tcpproxy-${1}-${2} cmd/tcpproxy/tcpproxy.go
  CGO_ENABLED=0 GOOS=$1 GOARCH=$2 go build -trimpath -o bin/tlssocksproxy-${1}-${2} cmd/tlssocksproxy/tlssocksproxy.go
  CGO_ENABLED=0 GOOS=$1 GOARCH=$2 go build -o bin/socksclient-${1}-${2} cmd/socksclient/socksclient.go
}
compiler linux amd64
#compiler linux 386 #has bug
compiler linux arm64
#compiler linux arm #has bug
