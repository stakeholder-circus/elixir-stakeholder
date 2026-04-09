> [!IMPORTANT]
> This repository is part of a Codex-assisted rewrite experiment. All changes are manually reviewed, a human remains in the loop, and missing behavior is tracked explicitly rather than hidden. The project exists for fun, research, language learning, AI agent workflow/planning, interop experiments, and code review testing.
# elixir-stakeholder

Elixir wider-matrix rewrite under `stakeholder-circus`.

## Status
- Local full rewrite tranche for `classic-six + modern-core`.
- Imported Rust history is preserved for attribution and auditability.
- Governance, provenance, hook, and CI baselines remain in place.
- Publication remains blocked until at least `10` new full rewrites with tests are complete.

## Role
- Actor-pipeline stress lane with BEAM-native deterministic orchestration.
- Purpose: concurrency, supervision, and message-passing stress for deterministic CLI/session generation.
- Program category: interop, ecosystem reach

## Native toolchain contract
- `python3 scripts/validate_scaffold.py`
- `mix local.hex --force`
- `mix local.rebar --force`
- `mix deps.get`
- `mix format --check-formatted`
- `mix credo --strict`
- `mix test`

## Docker contract
- `docker build -t elixir-stakeholder .`
- `docker run --rm elixir-stakeholder --list-values`
- focused JSON smokes for classic-six and modern-core families
- deterministic same-seed comparison
- explicit experimental-provider fail-fast

## Documentation
- [AI disclosure](AI_DISCLOSURE.md)
- [Parity](PARITY.md)
- [Explicit gaps](GAPS.md)
- [Remotes](docs/remotes.md)
- [Provenance](docs/provenance.md)
- [Toolchain](docs/toolchain.md)
- [Traceability](docs/traceability/first-push-families.md)
