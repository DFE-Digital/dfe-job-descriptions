require 'govuk_tech_docs'

GovukTechDocs.configure(self)

configure :build do
  set :http_prefix, '/dfe-job-descriptions'
end
