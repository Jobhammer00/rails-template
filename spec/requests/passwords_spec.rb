require "rails_helper"

RSpec.describe "Resetting a forgotten password" do
  include ActiveJob::TestHelper

  let(:user) { users(:one) }

  it "mails a reset link for a known address" do
    expect { post passwords_path, params: { email_address: user.email_address } }
      .to have_enqueued_mail(PasswordsMailer, :reset)
    expect(response).to redirect_to(new_session_path)
  end

  it "answers the same for an unknown address" do
    expect { post passwords_path, params: { email_address: "nobody@example.com" } }
      .not_to have_enqueued_mail
    expect(response).to redirect_to(new_session_path)
  end

  it "sets a new password with the token" do
    put password_path(user.password_reset_token), params: { password: "new-password", password_confirmation: "new-password" }
    expect(response).to redirect_to(new_session_path)
    expect(user.reload.authenticate("new-password")).to be_truthy
  end

  it "refuses an invalid token" do
    get edit_password_path("invalid")
    expect(response).to redirect_to(new_password_path)
  end
end
