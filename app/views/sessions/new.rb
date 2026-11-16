# frozen_string_literal: true

class Views::Sessions::New < Views::Base
  def initialize(email_address: nil)
    @email_address = email_address
  end

  def page_title = t("sessions.new.title")

  def view_template
    render Components::AuthCard.new(title: t("sessions.new.title")) do
      rails_form(action: session_path) do
        field "email_address", label: t("sessions.new.email_address"), type: :email, value: @email_address,
          required: true, autofocus: true, autocomplete: "username"
        field "password", label: t("sessions.new.password"), type: :password,
          required: true, autocomplete: "current-password", maxlength: 72
        Button(type: :submit, class: "w-full") { t("sessions.new.submit") }
        Link(href: new_password_path, variant: :link, class: "self-center") { t("sessions.new.forgot_password") }
      end
    end
  end
end
