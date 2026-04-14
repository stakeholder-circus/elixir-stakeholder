# Toolchain contract

## Native commands
- `python3 scripts/validate_scaffold.py`
- `mix local.hex --force`
- `mix local.rebar --force`
- `mix deps.get`
- `mix format --check-formatted`
- `mix credo --strict`
- `mix test`

## Docker commands
- `docker build -t elixir-stakeholder .`
- `docker run --rm elixir-stakeholder --list-values`
- focused JSON smokes for `code_analyzer`, `data_processing`, `agent_workflows`, and `delivery_preview_ops`
- deterministic same-seed comparison for `platform_engineering`
- explicit `--experimental-provider` fail-fast smoke

## Toolchain sources
- Homebrew / local runtime: `elixir`, `erlang`
- Hex ecosystem: `jason`, `credo`
- Docker gate: `elixir:1.19.4-otp-28`
- Nix: `flake.nix` and `flake.lock` for reproducible shell/app entry points
