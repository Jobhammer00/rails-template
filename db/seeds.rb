# The dev user. Safe to run twice; db:seed:replant runs it in CI.
User.find_or_create_by!(email_address: "dev@example.test") do |user|
  user.password = "password"
end
