# frozen_string_literal: true

require 'govuk_tech_docs'

GovukTechDocs.configure(self)

configure :build do
  set :relative_links, true
  activate :relative_assets
end
