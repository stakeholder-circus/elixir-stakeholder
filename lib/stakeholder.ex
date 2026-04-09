defmodule Stakeholder do
  @moduledoc false

  @base_timestamp ~U[2026-01-01 00:00:00Z]
  @dev_types [
    "backend",
    "blockchain",
    "data-science",
    "dev-ops",
    "frontend",
    "fullstack",
    "game-development",
    "machine-learning",
    "security",
    "systems-programming"
  ]
  @jargon_levels ["low", "normal", "high", "extreme"]
  @complexities ["low", "medium", "high", "extreme"]
  @output_formats ["text", "json"]
  @experimental_providers [
    "local-demo",
    "openai-compatible",
    "anthropic",
    "openai-consumer",
    "claude-consumer"
  ]
  @flags [
    "alerts",
    "project",
    "minimal",
    "team",
    "framework",
    "seed",
    "output-format",
    "no-color",
    "trace",
    "list-values",
    "experimental-provider",
    "focus-family"
  ]

  @dedicated_meta %{
    "code_analyzer" => %{
      context_key: "analysisFocus",
      context_detail: "typed interfaces, agent-authored patches, and MCP assumptions",
      rust_path: "src/generators/code_analyzer.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/CodeAnalyzerRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#code_analyzer"
    },
    "data_processing" => %{
      context_key: "dataWindow",
      context_detail:
        "embeddings, semantic chunks, and batch transforms with deterministic ordering",
      rust_path: "src/generators/data_processing.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/DataProcessingRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#data_processing"
    },
    "jargon" => %{
      context_key: "languagePolicy",
      context_detail: "credible 2026 terminology instead of fake-deep phrasing",
      rust_path: "src/generators/jargon.rs",
      java_path: "java-stakeholder/src/main/java/com/stakeholder/generators/JargonRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#jargon"
    },
    "metrics" => %{
      context_key: "signalBlend",
      context_detail: "queue depth, token spend, and GPU occupancy in a single operations lane",
      rust_path: "src/generators/metrics.rs",
      java_path: "java-stakeholder/src/main/java/com/stakeholder/generators/MetricsRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#metrics"
    },
    "network_activity" => %{
      context_key: "transportMix",
      context_detail: "RPC, event-stream, and adapter traffic under deterministic retry rules",
      rust_path: "src/generators/network_activity.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/NetworkActivityRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#network_activity"
    },
    "system_monitoring" => %{
      context_key: "telemetryScope",
      context_detail:
        "collector pressure, runner health, and policy-denial signals across the stack",
      rust_path: "src/generators/system_monitoring.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/SystemMonitoringRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#system_monitoring"
    },
    "agent_workflows" => %{
      context_key: "coordinationMode",
      context_detail: "delegated agent work, approval gates, and cross-repo handoff envelopes",
      rust_path: "src/generators/agent_workflows.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/AgentWorkflowsRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#agent_workflows"
    },
    "platform_engineering" => %{
      context_key: "platformSurface",
      context_detail:
        "golden paths, identity boundaries, and queue ownership in the shared platform lane",
      rust_path: "src/generators/platform_engineering.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/PlatformEngineeringRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#platform_engineering"
    },
    "observability_ai_runtime" => %{
      context_key: "runtimeSignals",
      context_detail:
        "trace spans, token burn, GPU pressure, and policy denials in one runtime lane",
      rust_path: "src/generators/observability_ai_runtime.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/ObservabilityAiRuntimeRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#observability_ai_runtime"
    },
    "delivery_preview_ops" => %{
      context_key: "deliveryGuardrail",
      context_detail:
        "preview deploys, canaries, release flags, and rollback checkpoints under seed control",
      rust_path: "src/generators/delivery_preview_ops.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/DeliveryPreviewOpsRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#delivery_preview_ops"
    },
    "supply_chain_security" => %{
      context_key: "supplyChainPosture",
      context_detail:
        "provenance, attestations, dependency drift, and secret exposure in one security lane",
      rust_path: "src/generators/supply_chain_security.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/SupplyChainSecurityRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md#supply_chain_security"
    }
  }

  @family_registry [
    %{
      id: "code_analyzer",
      label: "Code analyzer",
      group: "classic-six",
      summary: "Typed-code and patch review scenarios.",
      renderer_key: "classic-six.code_analyzer",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "data_processing",
      label: "Data processing",
      group: "classic-six",
      summary: "Deterministic data processing and chunking scenarios.",
      renderer_key: "classic-six.data_processing",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "jargon",
      label: "Jargon",
      group: "classic-six",
      summary: "Terminology and language-policy scenarios.",
      renderer_key: "classic-six.jargon",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "metrics",
      label: "Metrics",
      group: "classic-six",
      summary: "Operational metrics and signal blend scenarios.",
      renderer_key: "classic-six.metrics",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "network_activity",
      label: "Network activity",
      group: "classic-six",
      summary: "Transport, adapter, and retry scenarios.",
      renderer_key: "classic-six.network_activity",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "system_monitoring",
      label: "System monitoring",
      group: "classic-six",
      summary: "Telemetry, collector, and runner health scenarios.",
      renderer_key: "classic-six.system_monitoring",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "agent_workflows",
      label: "Agent workflows",
      group: "modern-core",
      summary: "Delegation, approval, and handoff scenarios.",
      renderer_key: "modern-core.agent_workflows",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "platform_engineering",
      label: "Platform engineering",
      group: "modern-core",
      summary: "Golden-path and shared platform scenarios.",
      renderer_key: "modern-core.platform_engineering",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "observability_ai_runtime",
      label: "Observability AI runtime",
      group: "modern-core",
      summary: "Trace, token, and runtime pressure scenarios.",
      renderer_key: "modern-core.observability_ai_runtime",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "delivery_preview_ops",
      label: "Delivery preview ops",
      group: "modern-core",
      summary: "Preview deploy, canary, and rollback scenarios.",
      renderer_key: "modern-core.delivery_preview_ops",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "supply_chain_security",
      label: "Supply chain security",
      group: "modern-core",
      summary: "Provenance and dependency posture scenarios.",
      renderer_key: "modern-core.supply_chain_security",
      smoke: true,
      parity_class: "full-parity"
    },
    %{
      id: "ai_governance",
      label: "AI governance",
      group: "ai-governance",
      summary: "Grouped fallback for AI-governance lanes.",
      renderer_key: "grouped-fallback.ai_governance",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "policy_automation",
      label: "Policy automation",
      group: "ai-governance",
      summary: "Grouped fallback for policy automation lanes.",
      renderer_key: "grouped-fallback.ai_governance",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "model_risk",
      label: "Model risk",
      group: "ai-governance",
      summary: "Grouped fallback for model-risk lanes.",
      renderer_key: "grouped-fallback.ai_governance",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "evaluation_ops",
      label: "Evaluation ops",
      group: "ai-governance",
      summary: "Grouped fallback for evaluation lanes.",
      renderer_key: "grouped-fallback.ai_governance",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "prompt_safety",
      label: "Prompt safety",
      group: "ai-governance",
      summary: "Grouped fallback for prompt safety lanes.",
      renderer_key: "grouped-fallback.ai_governance",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "security_blockchain",
      label: "Security blockchain",
      group: "security-blockchain",
      summary: "Grouped fallback for security and chain lanes.",
      renderer_key: "grouped-fallback.security_blockchain",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "smart_contract_risk",
      label: "Smart contract risk",
      group: "security-blockchain",
      summary: "Grouped fallback for smart-contract risk lanes.",
      renderer_key: "grouped-fallback.security_blockchain",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "wallet_observability",
      label: "Wallet observability",
      group: "security-blockchain",
      summary: "Grouped fallback for wallet telemetry lanes.",
      renderer_key: "grouped-fallback.security_blockchain",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "chain_forensics",
      label: "Chain forensics",
      group: "security-blockchain",
      summary: "Grouped fallback for chain forensics lanes.",
      renderer_key: "grouped-fallback.security_blockchain",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "identity_assurance",
      label: "Identity assurance",
      group: "security-blockchain",
      summary: "Grouped fallback for identity assurance lanes.",
      renderer_key: "grouped-fallback.security_blockchain",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "health_protocol",
      label: "Health protocol",
      group: "health-protocol",
      summary: "Grouped fallback for health and protocol lanes.",
      renderer_key: "grouped-fallback.health_protocol",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "clinical_workflows",
      label: "Clinical workflows",
      group: "health-protocol",
      summary: "Grouped fallback for clinical workflow lanes.",
      renderer_key: "grouped-fallback.health_protocol",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "medical_device_telemetry",
      label: "Medical device telemetry",
      group: "health-protocol",
      summary: "Grouped fallback for device telemetry lanes.",
      renderer_key: "grouped-fallback.health_protocol",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "protocol_translation",
      label: "Protocol translation",
      group: "health-protocol",
      summary: "Grouped fallback for protocol translation lanes.",
      renderer_key: "grouped-fallback.health_protocol",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "care_pathways",
      label: "Care pathways",
      group: "health-protocol",
      summary: "Grouped fallback for care pathway lanes.",
      renderer_key: "grouped-fallback.health_protocol",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "overlay_quantum",
      label: "Overlay quantum",
      group: "overlay-quantum",
      summary: "Grouped fallback for overlay and quantum lanes.",
      renderer_key: "grouped-fallback.overlay_quantum",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "quantum_networking",
      label: "Quantum networking",
      group: "overlay-quantum",
      summary: "Grouped fallback for quantum networking lanes.",
      renderer_key: "grouped-fallback.overlay_quantum",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "privacy_ops",
      label: "Privacy ops",
      group: "overlay-quantum",
      summary: "Grouped fallback for privacy operations lanes.",
      renderer_key: "grouped-fallback.overlay_quantum",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "workload_identity",
      label: "Workload identity",
      group: "overlay-quantum",
      summary: "Grouped fallback for workload identity lanes.",
      renderer_key: "grouped-fallback.overlay_quantum",
      smoke: false,
      parity_class: "grouped-fallback"
    },
    %{
      id: "edge_inference",
      label: "Edge inference",
      group: "overlay-quantum",
      summary: "Grouped fallback for edge inference lanes.",
      renderer_key: "grouped-fallback.overlay_quantum",
      smoke: false,
      parity_class: "grouped-fallback"
    }
  ]

  def run(args) do
    case parse_args(args) do
      {:ok, config} -> run_config(config)
      {:error, message} -> failure(message)
    end
  end

  def family_registry, do: @family_registry
  def experimental_providers, do: @experimental_providers

  defp run_config(config) do
    case preflight_response(config) do
      nil -> run_family_response(config)
      result -> result
    end
  end

  defp preflight_response(config) do
    cond do
      config.help ->
        success(help_text())

      config.list_values ->
        success(Jason.encode!(list_values_payload()) <> "\n")

      config.experimental_provider ->
        failure(
          "experimental-provider is not implemented yet in elixir-stakeholder (#{config.experimental_provider})"
        )

      is_nil(config.focus_family) or config.focus_family == "" ->
        failure("Missing required --focus-family.")

      true ->
        nil
    end
  end

  defp run_family_response(config) do
    case Enum.find(@family_registry, &(&1.id == config.focus_family)) do
      nil ->
        failure("Unknown focus family '#{config.focus_family}'.")

      family ->
        family
        |> session_payload(config)
        |> render_output(config.output_format)
        |> success()
    end
  end

  defp render_output(payload, "json"), do: Jason.encode!(payload) <> "\n"
  defp render_output(payload, _format), do: render_text(payload)

  defp parse_args(args) do
    {opts, rest, invalid} =
      OptionParser.parse(args,
        strict: [
          help: :boolean,
          list_values: :boolean,
          alerts: :boolean,
          minimal: :boolean,
          trace: :boolean,
          no_color: :boolean,
          dev_type: :string,
          complexity: :string,
          jargon: :string,
          output_format: :string,
          seed: :string,
          focus_family: :string,
          team: :string,
          framework: :string,
          project: :string,
          duration: :integer,
          experimental_provider: :string
        ],
        aliases: [h: :help]
      )

    cond do
      invalid != [] ->
        {:error, invalid_message(List.first(invalid))}

      rest != [] ->
        {:error, "Unknown argument '#{hd(rest)}'."}

      true ->
        default_config()
        |> Map.merge(Map.new(opts))
        |> validate_config()
    end
  end

  defp validate_config(config) do
    with :ok <- validate_enum(config.dev_type, @dev_types, "--dev-type"),
         :ok <- validate_enum(config.complexity, @complexities, "--complexity"),
         :ok <- validate_enum(config.jargon, @jargon_levels, "--jargon"),
         :ok <- validate_enum(config.output_format, @output_formats, "--output-format"),
         :ok <- validate_duration(config.duration) do
      {:ok, config}
    end
  end

  defp validate_enum(value, _allowed, _flag) when is_nil(value), do: :ok

  defp validate_enum(value, allowed, flag) do
    if value in allowed, do: :ok, else: {:error, "Invalid value '#{value}' for #{flag}."}
  end

  defp validate_duration(duration) when is_integer(duration) and duration >= 0, do: :ok
  defp validate_duration(duration), do: {:error, "Invalid value '#{duration}' for --duration."}

  defp invalid_message({flag, nil}), do: "Unknown argument '--#{flag_name(flag)}'."
  defp invalid_message({flag, value}), do: "Invalid value '#{value}' for --#{flag_name(flag)}."

  defp flag_name(flag) do
    flag
    |> to_string()
    |> String.replace("_", "-")
  end

  defp default_config do
    %{
      help: false,
      list_values: false,
      experimental_provider: nil,
      dev_type: "backend",
      complexity: "medium",
      jargon: "normal",
      output_format: "text",
      seed: "default-seed",
      focus_family: nil,
      alerts: false,
      team: "platform",
      minimal: false,
      trace: false,
      framework: "phoenix",
      project: "stakeholder-circus",
      duration: 60,
      no_color: false
    }
  end

  defp session_payload(family, config) do
    hash = deterministic_hash(config.seed, family.id)
    meta = Map.get(@dedicated_meta, family.id, grouped_fallback_meta(family))

    timestamp =
      @base_timestamp
      |> DateTime.add(rem(hash, 3600 * 24 * 180), :second)
      |> DateTime.to_iso8601()

    sequence = rem(hash, 9000) + 1000

    context = %{
      "family" => family.id,
      "rendererKey" => family.renderer_key,
      "parityClass" => family.parity_class,
      "devType" => config.dev_type,
      "complexity" => config.complexity,
      "jargon" => config.jargon,
      "team" => config.team,
      "framework" => config.framework,
      "project" => config.project,
      "duration" => config.duration,
      "alerts" => config.alerts,
      "minimal" => config.minimal,
      "trace" => config.trace,
      meta.context_key => meta.context_detail,
      "rustPath" => meta.rust_path,
      "javaPath" => meta.java_path,
      "corePath" => meta.core_path
    }

    %{
      "eventType" => "session.generated",
      "sequence" => sequence,
      "family" => family.id,
      "message" => build_message(family, config, meta.context_detail),
      "timestamp" => timestamp,
      "context" => context
    }
  end

  defp build_message(family, config, detail) do
    if family.parity_class == "full-parity" do
      "#{family.label} for #{config.dev_type} teams emphasizes #{detail}."
    else
      "#{family.label} currently runs through grouped fallback while the dedicated tranche is deferred; keep attention on #{detail}."
    end
  end

  defp grouped_fallback_meta(family) do
    renderer_group = String.replace_prefix(family.renderer_key, "grouped-fallback.", "")

    %{
      context_key: "groupFallback",
      context_detail: "later packet families remain grouped until their dedicated tranche lands",
      rust_path: "src/activities.rs",
      java_path:
        "java-stakeholder/src/main/java/com/stakeholder/generators/GroupedFallbackRenderer.java",
      core_path: "stakeholder-core/docs/traceability-matrix.md##{renderer_group}"
    }
  end

  defp deterministic_hash(seed, family_id) do
    :erlang.crc32("#{seed}::#{family_id}")
  end

  defp list_values_payload do
    %{
      "generatorFamilies" => Enum.map(@family_registry, &family_payload/1),
      "devTypes" => @dev_types,
      "jargonLevels" => @jargon_levels,
      "complexities" => @complexities,
      "outputFormats" => @output_formats,
      "experimentalProviders" => @experimental_providers,
      "flags" => @flags
    }
  end

  defp family_payload(family) do
    %{
      "id" => family.id,
      "label" => family.label,
      "group" => family.group,
      "summary" => family.summary,
      "rendererKey" => family.renderer_key,
      "smoke" => family.smoke,
      "parityClass" => family.parity_class
    }
  end

  defp render_text(payload) do
    context = payload["context"]

    [
      "eventType: #{payload["eventType"]}",
      "sequence: #{payload["sequence"]}",
      "family: #{payload["family"]}",
      "timestamp: #{payload["timestamp"]}",
      "message: #{payload["message"]}",
      "rendererKey: #{context["rendererKey"]}"
    ]
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end

  defp help_text do
    """
    elixir-stakeholder
    Required:
      --focus-family <family-id>

    Optional:
      --dev-type <#{Enum.join(@dev_types, "|")}>
      --complexity <#{Enum.join(@complexities, "|")}>
      --jargon <#{Enum.join(@jargon_levels, "|")}>
      --output-format <#{Enum.join(@output_formats, "|")}>
      --seed <value>
      --team <value>
      --framework <value>
      --project <value>
      --duration <minutes>
      --alerts --minimal --trace --no-color
      --list-values
      --experimental-provider <value>
    """
    |> String.trim_trailing()
    |> Kernel.<>("\n")
  end

  defp success(stdout), do: %{exit_code: 0, stdout: stdout, stderr: ""}
  defp failure(message), do: %{exit_code: 1, stdout: "", stderr: message <> "\n"}
end
