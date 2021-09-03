FROM golang:1.17.0-bullseye
# Now $GO111MODULE is on by default:
# https://blog.golang.org/go116-module-changes#TOC_2.
# Modern project should turn on module-aware mode and use Go Module
# ENV GO111MODULE=on
# For compatibility with Visual Studio Code
WORKDIR /workspace
# 2021-06-10 Visual Studio Code uses
# Ctrl + Shift + P -> Go: Install/Update Tools
RUN go get github.com/uudashr/gopkgs/v2/cmd/gopkgs
RUN go get github.com/ramya-rao-a/go-outline
RUN go get github.com/cweill/gotests/...
RUN go get github.com/fatih/gomodifytags
RUN go get github.com/josharian/impl
RUN go get github.com/haya14busa/goplay/cmd/goplay
RUN go get github.com/go-delve/delve/cmd/dlv
# see: https://github.com/golang/vscode-go/blob/master/docs/dlv-dap.md
RUN GOBIN=/tmp/ go get github.com/go-delve/delve/cmd/dlv@master \
 && mv /tmp/dlv $GOPATH/bin/dlv-dap
RUN go get github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get golang.org/x/tools/gopls
# To use godoc
# see:
#   Answer: ubuntu - How to make "godoc" command work on my system? - Stack Overflow
#   https://stackoverflow.com/a/22727173/12721873
RUN go get golang.org/x/tools/cmd/godoc
# Install dependencies
# COPY . /workspace/
# RUN go install
