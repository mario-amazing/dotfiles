require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ["sadmin", "pushk1nrules"]
end

Sidekiq.poll_interval = 1
