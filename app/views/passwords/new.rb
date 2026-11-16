# frozen_string_literal: true

class Views::Passwords::New < Views::Base
  def page_title = t("passwords.new.title")

  def view_template
    render Components::AuthCard.new(title: t("passwords.new.title"), description: t("passwords.new.description")) do
      rails_form(action: passwords_path) do
        field "email_address", label: t("sessions.new.email_address"), type: :email,
          required: true, autofocus: true, autocomplete: "username"
        Button(type: :submit, class: "w-full") { t("passwords.new.submit") }
        Link(href: new_session_path, variant: :link, class: "self-center") { t("passwords.new.back") }
      end
    end
  end
end
