# frozen_string_literal: true

# The centred card of the pages you see before signing in.
class Components::AuthCard < Components::Base
  def initialize(title:, description: nil)
    @title = title
    @description = description
  end

  def view_template(&)
    div(class: "mx-auto w-full max-w-sm") do
      Card do
        CardHeader do
          CardTitle { @title }
          CardDescription { @description } if @description
        end
        CardContent(&)
      end
    end
  end
end
