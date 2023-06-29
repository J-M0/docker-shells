# docker-shells
#
# A docker image which contains many popular shells, just for experimentation.y 
#
# - sh
# - bash
# - csh
# - ksh
# - zsh
# - fish
FROM debian:bullseye as builder

# Some metadata.
MAINTAINER Dave Kerr <github.com/dwmkerr>

# Install tools we'll need to compile shells.
RUN apt-get update -y && apt-get install -y build-essential

# Add the heirloom shell code, then compile it.
ADD heirloom-sh-050706.tar.bz2 /build
WORKDIR /build/heirloom-sh-050706
RUN make

FROM debian:bullseye-slim

COPY --from=builder /build/heirloom-sh-050706/sh /bin/heirloom-sh

RUN apt-get update && apt-get install -y \
    # Install pstree (useful for explicitly showing the current shell!)
    psmisc \
    # Install a bunch o shells.
    csh \
    tcsh \
    ksh \
    zsh \
    fish \
    ash \
    dash \
    && rm -r /var/lib/apt/lists/*

# # Add the test script.
ADD ./test/test.sh .
