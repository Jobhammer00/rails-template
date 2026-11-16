class SettingsController < ApplicationController
  def show
    render Views::Settings::Show.new(user: Current.user)
  end

  # Rails checks password_challenge against the current password (has_secure_password).
  def update
    user = Current.user
    if user.update(params.expect(user: %i[ password_challenge password password_confirmation ]))
      redirect_to settings_path, notice: t("settings.updated")
    else
      render Views::Settings::Show.new(user:), status: :unprocessable_content
    end
  end
end
