require 'gem_checks/simple_logger'
require 'logger'
require 'nokogiri'
require 'open-uri'

class GemnasiumClient
  def initialize(logger: SimpleLogger.new)
    @logger = set_log_level(logger)
  end

  def vulnerable?(gem_name:, version:)
    uri = client_url(gem_name, version)
    log_analysis(gem_name, version)
    query_gemnasium(uri)
  end

  def logger=(logger)
    @logger = set_log_level(logger)
  end

  private

  def log_analysis(gem_name, version)
    @logger.info("Analysing: #{gem_name}, version: #{version}")
  end

  def set_log_level(logger)
    level = ENV.fetch('LOG_LEVEL') { Logger::INFO }.to_i
    logger.tap do |l|
      l.level = level
    end
  end

  def gem_vulnerable?(doc)
    doc.css('div.accordion.advisory.affected').count >= 1
  end

  def query_gemnasium(uri)
    open(uri) do |gemnasium_raw|
      doc = Nokogiri::HTML(gemnasium_raw)
      gem_vulnerable?(doc)
    end
  rescue OpenURI::HTTPError
    false
  rescue Errno::ECONNRESET
    query_gemnasium(uri)
  end

  def client_url(gem_name, version)
    "https://gemnasium.com/gems/#{gem_name}/versions/#{version}"
  end
end
