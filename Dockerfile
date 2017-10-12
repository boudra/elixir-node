FROM elixir:1.5

ENV LANG=C.UTF-8

RUN mix local.hex --force && mix local.rebar --force

RUN curl -sL https://deb.nodesource.com/setup_8.x \
    | bash - && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

CMD ["bin/bash"]
