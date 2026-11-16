require "rails_helper"

RSpec.describe "Settings" do
  let(:user) { users(:one) }

  before { sign_in_as user }

  it "shows the password form" do
    get settings_path
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Huidig wachtwoord")
  end

  it "changes the password with the current one" do
    patch settings_path, params: { user: { password_challenge: "password", password: "new-password", password_confirmation: "new-password" } }
    expect(response).to redirect_to(settings_path)
    expect(user.reload.authenticate("new-password")).to be_truthy
  end

  it "refuses a wrong current password with a readable message" do
    patch settings_path, params: { user: { password_challenge: "wrong", password: "new-password", password_confirmation: "new-password" } }
    expect(response).to have_http_status(:unprocessable_content)
    expect(response.body).to include("Huidig wachtwoord is ongeldig")
    expect(user.reload.authenticate("password")).to be_truthy
  end

  it "refuses two different new passwords" do
    patch settings_path, params: { user: { password_challenge: "password", password: "new-password", password_confirmation: "other" } }
    expect(response).to have_http_status(:unprocessable_content)
    expect(response.body).to include("komt niet overeen")
  end
end
