require 'open-uri'
require 'nokogiri'

class GemnasiumClient
  def vulnerable?(gem_name:, version:)
    uri = client_url(gem_name, version)
    query_gemnasium(uri)
  end

  private

  def gem_vulnerable?(doc)
    doc.css('div.accordion.advisory.affected').count >= 1
  end

  def query_gemnasium(uri)
    begin
      doc = Nokogiri::HTML(open(uri))
    rescue OpenURI::HTTPError
      return false
    end
    gem_vulnerable?(doc)
  end

  def client_url(gem_name, version)
    "https://gemnasium.com/gems/#{gem_name}/versions/#{version}"
  end
end
