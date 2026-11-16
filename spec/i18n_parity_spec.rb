require "rails_helper"

# Every user-facing string exists in nl and en (rules/frontend.md).
RSpec.describe "locale files" do
  def keys(hash, prefix = nil)
    hash.flat_map do |key, value|
      path = [ prefix, key ].compact.join(".")
      value.is_a?(Hash) ? keys(value, path) : [ path ]
    end
  end

  def app_keys(locale)
    Rails.root.glob("config/locales/**/#{locale}.yml").flat_map { |file| keys(YAML.load_file(file).fetch(locale.to_s)) }.sort
  end

  it "has the same keys in nl and en" do
    expect(app_keys(:en)).to eq(app_keys(:nl))
  end
end
