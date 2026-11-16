# Bullet raises on an N+1 in test (rules/testing.md).
if defined?(Bullet)
  RSpec.configure do |config|
    config.before { Bullet.start_request }
    config.after do
      Bullet.perform_out_of_channel_notifications if Bullet.notification?
      Bullet.end_request
    end
  end
end
