# frozen_string_literal: true

class Views::Passwords::Edit < Views::Base
  def initialize(token:)
    @token = token
  end

  def page_title = t("passwords.edit.title")

  def view_template
    render Components::AuthCard.new(title: t("passwords.edit.title")) do
      rails_form(action: password_path(@token), method: :put) do
        field "password", label: t("passwords.edit.password"), type: :password,
          required: true, autocomplete: "new-password", maxlength: 72
        field "password_confirmation", label: t("passwords.edit.password_confirmation"), type: :password,
          required: true, autocomplete: "new-password", maxlength: 72
        Button(type: :submit, class: "w-full") { t("passwords.edit.submit") }
      end
    end
  end
end
