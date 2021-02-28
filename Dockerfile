FROM golang:1.16.0-buster
ENV GO111MODULE=on
# 2020-11-21 Visual Studio Code uses
# Ctrl + Shift + P -> Go: Install/Update Tools
RUN go get github.com/mdempsky/gocode
RUN go get github.com/uudashr/gopkgs/v2/cmd/gopkgs
RUN go get github.com/ramya-rao-a/go-outline
RUN go get github.com/acroca/go-symbols
RUN go get golang.org/x/tools/cmd/guru
RUN go get golang.org/x/tools/cmd/gorename
RUN go get github.com/cweill/gotests/...
RUN go get github.com/fatih/gomodifytags
RUN go get github.com/josharian/impl
RUN go get github.com/davidrjenni/reftools/cmd/fillstruct
RUN go get github.com/haya14busa/goplay/cmd/goplay
RUN go get github.com/godoctor/godoctor
RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get github.com/stamblerre/gocode
RUN go get github.com/rogpeppe/godef
RUN go get github.com/sqs/goreturns
RUN go get golang.org/x/lint/golint
RUN go get golang.org/x/tools/gopls
RUN go get github.com/hashicorp/go-version
# To lint
RUN go get github.com/golangci/golangci-lint/cmd/golangci-lint
