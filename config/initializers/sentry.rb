# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://2cc77708373d96d1a9aa89a8e0c3b945@o4506438536003584.ingest.sentry.io/4506438658293760'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.enabled_environments = %w[production staging]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
