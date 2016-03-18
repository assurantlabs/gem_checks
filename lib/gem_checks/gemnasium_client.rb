require 'logger'
require 'open-uri'
require 'nokogiri'

class GemnasiumClient
  def initialize(logger=Logger.new(STDOUT))
    @logger = set_log_level(logger)
  end

  def vulnerable?(gem_name:, version:)
    uri = client_url(gem_name, version)
    log_analysis(gem_name, version)
    query_gemnasium(uri)
  end

  private

  def log_analysis(gem_name, version)
    @logger.info("Analysing: #{gem_name}, version: #{version}")
  end

  def set_log_level(logger)
    level = ENV.fetch('LOG_LEVEL') { Logger::INFO }.to_i
    logger.tap do |logger|
      logger.level = level
    end
  end

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
