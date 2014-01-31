Dummy::Application.configure do
  config.cache_classes = true
  config.eager_load = true

  # Staccato configuration
  config.staccato.tracker_id = 'UA-1234-5'
  config.staccato.hostname = 'domain.com' # optional, but recommended
end
