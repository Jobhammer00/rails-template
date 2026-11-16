# frozen_string_literal: true

# Account settings: for now changing your password, with your current one as the check.
class Views::Settings::Show < Views::Base
  def initialize(user:)
    @user = user
  end

  def page_title = t("settings.show.title")

  def view_template
    Heading(level: 1) { t("settings.show.title") }

    Card(class: "mt-6 max-w-md") do
      CardHeader do
        CardTitle { t("settings.show.password.title") }
        CardDescription { t("settings.show.password.description") }
      end
      CardContent do
        rails_form(action: settings_path, method: :patch) do
          field "user[password_challenge]", label: t("settings.show.password.current"), type: :password,
            required: true, autocomplete: "current-password", error: error_for(:password_challenge)
          field "user[password]", label: t("settings.show.password.new"), type: :password,
            required: true, autocomplete: "new-password", maxlength: 72, error: error_for(:password)
          field "user[password_confirmation]", label: t("settings.show.password.confirmation"), type: :password,
            required: true, autocomplete: "new-password", maxlength: 72, error: error_for(:password_confirmation)
          Button(type: :submit) { t("settings.show.password.submit") }
        end
      end
    end
  end

  private

  def error_for(attribute) = @user.errors.full_messages_for(attribute).first
end
