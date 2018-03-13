FROM debian:jessie

ENV LANG=C.UTF-8

RUN echo "deb http://packages.erlang-solutions.com/debian jessie contrib" >> /etc/apt/sources.list && \
    apt-key adv --fetch-keys http://packages.erlang-solutions.com/debian/erlang_solutions.asc && \
    apt-get -qq update && apt-get install --force-yes -y --no-install-recommends \
        esl-erlang=1:20.2.2 \
        openssh-client \
        ca-certificates \
        curl \
        git \
        build-essential \
        pkg-config \
        mysql-client \
        xfonts-base \
        xfonts-75dpi \
        rlwrap \
        netbase \
        wget \
        g++ && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget -q https://github.com/elixir-lang/elixir/releases/download/v1.6.0/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm -f Precompiled.zip && \
    ln -s /elixir/bin/elixirc /usr/local/bin/elixirc && \
    ln -s /elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /elixir/bin/mix /usr/local/bin/mix && \
    ln -s /elixir/bin/iex /usr/local/bin/iex && \
    /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force && \
    wget https://deb.nodesource.com/node_9.x/pool/main/n/nodejs/nodejs_9.4.0-1nodesource1_amd64.deb  --no-check-certificate && \
    dpkg -i nodejs_8.7.0-1nodesource1_amd64.deb && \
    rm nodejs_8.7.0-1nodesource1_amd64.deb && \
    echo "prefix = ${HOME}/.node" > ~/.npmrc && \
    PATH="$HOME/.node/bin:$PATH"

CMD ["bin/bash"]
