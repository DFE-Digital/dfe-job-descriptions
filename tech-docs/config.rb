# frozen_string_literal: true

require 'govuk_tech_docs'

GovukTechDocs::TableOfContents::Helpers.module_eval do
  def list_items_from_headings(html, url: '', max_level: nil)
    headings = GovukTechDocs::TableOfContents::HeadingsBuilder.new(html, url).headings

    if headings.none? { |heading| heading.size == 1 }
      resource = sitemap.find_resource_by_path("#{url[1..]}index.html")
      html = "<h1>#{resource.data.title}</h1>"
      headings = GovukTechDocs::TableOfContents::HeadingsBuilder.new(html, url).headings
    end

    tree = GovukTechDocs::TableOfContents::HeadingTreeBuilder.new(headings).tree
    GovukTechDocs::TableOfContents::HeadingTreeRenderer.new(tree, max_level: max_level).html
  end
end

GovukTechDocs.configure(self)

configure :build do
  set :http_prefix, '/dfe-job-descriptions'
end
