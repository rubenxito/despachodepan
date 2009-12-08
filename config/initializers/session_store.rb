# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_despachodepan_session',
  :secret      => '2219ab1fec41192a74f103a0f045576943eb1cc5cbaad31df3182ed55e4e57d326fa8e0bff412b6ac5142fe5bad92f13f0ef1177f426f94516e3bee5fe3cff6d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
