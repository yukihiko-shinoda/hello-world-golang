FROM golang:1.21.12-bookworm
# Now $GO111MODULE is on by default:
# https://blog.golang.org/go116-module-changes#TOC_2.
# Modern project should turn on module-aware mode and use Go Module
# ENV GO111MODULE=on
# For compatibility with Visual Studio Code
WORKDIR /workspace
# 2024-07-31 Visual Studio Code uses
# Ctrl + Shift + P -> Go: Install/Update Tools
RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/cweill/gotests/...@v1.6.0
RUN go install github.com/fatih/gomodifytags@v1.16.0
RUN go install github.com/josharian/impl@v1.1.0
RUN go install github.com/haya14busa/goplay/cmd/goplay@v1.0.0
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
# To use godoc
# see:
#   Answer: ubuntu - How to make "godoc" command work on my system? - Stack Overflow
#   https://stackoverflow.com/a/22727173/12721873
RUN go install golang.org/x/tools/cmd/godoc@latest
# Install dependencies
# COPY . /workspace/
# RUN go install
