# frozen_string_literal: true

# The first page after signing in. A new app replaces the body with its own overview.
class Views::Dashboards::Show < Views::Base
  def initialize(user:)
    @user = user
  end

  def page_title = t("dashboards.show.title")

  def view_template
    Heading(level: 1) { t("dashboards.show.title") }
    Text(class: "mt-2 text-muted-foreground") { t("dashboards.show.welcome", email_address: @user.email_address) }
  end
end
