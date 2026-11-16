# frozen_string_literal: true

# Every page view. Pages are Phlex; the layout is app/views/layouts/application.html.erb.
class Views::Base < Components::Base
  include Phlex::Rails::Helpers::T
  include Phlex::Rails::Helpers::FormAuthenticityToken
  include Phlex::Rails::Helpers::ContentFor

  # The browser tab shows the page's title; every page defines page_title.
  def before_template
    content_for(:title, page_title)
    super
  end

  def cache_store = Rails.cache

  private

  # A RubyUI form that posts to Rails, with the CSRF token and the HTTP method Rails expects.
  def rails_form(action:, method: :post, &)
    Form(action:, method: :post, class: "flex flex-col gap-4") do
      input(type: :hidden, name: "authenticity_token", value: form_authenticity_token)
      input(type: :hidden, name: "_method", value: method) unless method == :post
      yield
    end
  end

  def field(name, label:, type: :text, error: nil, **attrs)
    FormField do
      FormFieldLabel(for: name) { label }
      Input(type:, name:, id: name, **attrs)
      FormFieldError { error } if error
    end
  end
end
