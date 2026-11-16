require "rails_helper"

RSpec.describe "Signing in" do
  let(:user) { users(:one) }

  it "shows the sign-in page" do
    get new_session_path
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Inloggen", "Wachtwoord vergeten?")
  end

  it "sends a visitor who is not signed in to the sign-in page" do
    get root_path
    expect(response).to redirect_to(new_session_path)
  end

  it "signs in and lands on the dashboard" do
    sign_in_as user
    expect(response).to redirect_to(root_url)

    follow_redirect!
    expect(response.body).to include("Je bent ingelogd als #{user.email_address}.")
  end

  it "refuses a wrong password with a readable message and keeps the email address" do
    sign_in_as user, password: "wrong"
    follow_redirect!
    expect(response.body).to include("Dit e-mailadres en wachtwoord horen niet bij elkaar.", user.email_address)
  end

  it "signs out" do
    sign_in_as user
    delete session_path
    expect(response).to redirect_to(new_session_path)

    get root_path
    expect(response).to redirect_to(new_session_path)
  end
end
