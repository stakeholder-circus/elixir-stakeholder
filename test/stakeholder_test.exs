defmodule StakeholderTest do
  use ExUnit.Case, async: true

  @dedicated_families [
    {"code_analyzer", "analysisFocus", "classic-six.code_analyzer"},
    {"data_processing", "dataWindow", "classic-six.data_processing"},
    {"jargon", "languagePolicy", "classic-six.jargon"},
    {"metrics", "signalBlend", "classic-six.metrics"},
    {"network_activity", "transportMix", "classic-six.network_activity"},
    {"system_monitoring", "telemetryScope", "classic-six.system_monitoring"},
    {"agent_workflows", "coordinationMode", "modern-core.agent_workflows"},
    {"platform_engineering", "platformSurface", "modern-core.platform_engineering"},
    {"observability_ai_runtime", "runtimeSignals", "modern-core.observability_ai_runtime"},
    {"delivery_preview_ops", "deliveryGuardrail", "modern-core.delivery_preview_ops"},
    {"supply_chain_security", "supplyChainPosture", "modern-core.supply_chain_security"}
  ]

  test "list-values exposes the full registry and dedicated renderer keys" do
    result = Stakeholder.run(["--list-values"])
    assert result.exit_code == 0

    payload = Jason.decode!(result.stdout)
    families = payload["generatorFamilies"]

    assert is_list(families)
    assert Enum.count(families) >= 30
    assert Enum.any?(families, &(&1["id"] == "code_analyzer"))
    assert Enum.any?(families, &(&1["id"] == "delivery_preview_ops"))
    assert Enum.all?(families, &Map.has_key?(&1, "rendererKey"))
  end

  for {family_id, context_key, renderer_key} <- @dedicated_families do
    test "#{family_id} emits dedicated metadata" do
      result =
        Stakeholder.run([
          "--focus-family",
          unquote(family_id),
          "--output-format",
          "json",
          "--seed",
          "smoke"
        ])

      assert result.exit_code == 0
      payload = Jason.decode!(result.stdout)
      assert payload["family"] == unquote(family_id)
      assert payload["context"][unquote(context_key)]
      assert payload["context"]["rendererKey"] == unquote(renderer_key)
    end
  end

  test "deterministic json stays stable for the same seed" do
    args = [
      "--focus-family",
      "platform_engineering",
      "--output-format",
      "json",
      "--seed",
      "same-seed"
    ]

    first = Stakeholder.run(args)
    second = Stakeholder.run(args)

    assert first.exit_code == 0
    assert first.stdout == second.stdout
  end

  test "experimental provider flags fail fast" do
    result = Stakeholder.run(["--experimental-provider", "openai-compatible"])
    assert result.exit_code == 1
    assert result.stderr =~ "experimental-provider is not implemented yet in elixir-stakeholder"
  end
end
