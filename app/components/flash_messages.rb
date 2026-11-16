# frozen_string_literal: true

# The notice and alert of the last redirect. A destructive alert is red.
class Components::FlashMessages < Components::Base
  def initialize(flash:)
    @flash = flash
  end

  def view_template
    return if @flash.empty?

    div(class: "mx-auto mb-6 flex w-full max-w-3xl flex-col gap-2") do
      Alert(id: "notice") { AlertDescription { @flash[:notice] } } if @flash[:notice]
      Alert(id: "alert", variant: :destructive) { AlertDescription { @flash[:alert] } } if @flash[:alert]
    end
  end
end
