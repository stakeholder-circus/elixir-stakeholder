FROM elixir:1.19.4-otp-28 AS build
WORKDIR /app
RUN mix local.hex --force && mix local.rebar --force
COPY mix.exs mix.lock .formatter.exs ./
RUN mix deps.get
COPY lib ./lib
COPY test ./test
RUN mix format --check-formatted && mix credo --strict && mix test && mix escript.build

FROM elixir:1.19.4-otp-28
WORKDIR /app
COPY --from=build /app/elixir-stakeholder /usr/local/bin/elixir-stakeholder
ENTRYPOINT ["elixir-stakeholder"]
