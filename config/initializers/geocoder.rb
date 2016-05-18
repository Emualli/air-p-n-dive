Geocoder.configure(
  lookup:    :google,
  api_key:   ENV['GOOGLE_MAPS_SERVER_KEY'],
  use_https: true,
  units:     :km       # :km for kilometers or :mi for mile
)
