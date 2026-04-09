{
  description = "stakeholder-circus elixir-stakeholder local full rewrite tranche";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      devShells = forAllSystems (system:
        let pkgs = import nixpkgs { inherit system; };
        in {
          default = pkgs.mkShell {
            packages = with pkgs; [ git jq python312 elixir erlang rebar3 ];
          };
        });
      apps = forAllSystems (system:
        let pkgs = import nixpkgs { inherit system; };
            mk = name: text: {
              type = "app";
              program = "${pkgs.writeShellScript name text}";
            };
        in {
          build = mk "build" ''mix local.hex --force >/dev/null && mix local.rebar --force >/dev/null && mix deps.get && mix compile'';
          test = mk "test" ''mix local.hex --force >/dev/null && mix local.rebar --force >/dev/null && mix deps.get && mix test'';
          check = mk "check" ''mix local.hex --force >/dev/null && mix local.rebar --force >/dev/null && mix deps.get && mix format --check-formatted && mix credo --strict && mix test'';
          format = mk "format" ''mix format'';
        });
    };
}
