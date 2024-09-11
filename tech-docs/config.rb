# frozen_string_literal: true

require 'govuk_tech_docs'

redirect "/*", to: "https://job-descriptions.education.gov.uk", status: 301

GovukTechDocs.configure(self)

configure :build do
  set :relative_links, true
  activate :relative_assets
end
