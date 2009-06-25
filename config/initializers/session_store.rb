# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tubform-rsig_session',
  :secret      => 'e862148d411a4e0eb4c31de2505c1248722614ee7804b4d5a3a7d2def033fc67c93940c1da5317a6b146cbe457b769c0351be58a4495fb8fba1b2da1507c4eef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
