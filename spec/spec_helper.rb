require 'logger'
ENV['LOG_LEVEL'] = Logger::WARN.to_s

def open_unsafe_one_vuln_file
  path = File.expand_path('../fixtures/gemfiles/one_vuln_lockfile', __FILE__)
  File.new(path)
end

def open_safe_file
  path = File.expand_path('../fixtures/gemfiles/no_vulns_lockfile', __FILE__)
  File.new(path)
end

def safe_parsed_results
  [
    { gem_name: 'minitest', version: '5.8.4' },
    { gem_name: 'rake', version: '11.1.1' }
  ]
end

def vulnerable_gem
  { gem_name: 'rest-client', version: '1.6.0' }
end

def vulnerable_parsed_results
  safe_parsed_results << vulnerable_gem
end
