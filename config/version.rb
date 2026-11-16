# frozen_string_literal: true

# The release tag (EPOCH.MAJOR.MINOR.PATCH) from the Release workflow. Kamal sets KAMAL_VERSION;
# elsewhere it is the latest v* tag, else "dev". Nothing is committed back.
module RailsTemplate
  VERSION = ENV.fetch("KAMAL_VERSION") do
    `git describe --tags --abbrev=0 2>/dev/null`.strip.delete_prefix("v")
  rescue SystemCallError
    ""
  end.then { it.empty? ? "dev" : it }
end
