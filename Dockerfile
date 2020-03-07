FROM alpine:latest

RUN apk add -U --no-cache \
    neovim git \
    zsh tmux openssh-client bash ncurses \
    curl less man  
