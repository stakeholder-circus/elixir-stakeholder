defmodule Stakeholder.CLI do
  @moduledoc false

  def main(args) do
    result = Stakeholder.run(args)

    if result.stdout != "" do
      IO.write(result.stdout)
    end

    if result.stderr != "" do
      IO.write(:stderr, result.stderr)
    end

    System.halt(result.exit_code)
  end
end
