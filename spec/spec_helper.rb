def open_unsafe_one_vuln_file
  path = File.expand_path('../fixtures/gemfiles/one_vuln_lockfile', __FILE__)
  File.new(path)
end

def open_safe_file
  path = File.expand_path('../fixtures/gemfiles/no_vulns_lockfile', __FILE__)
  File.new(path)
end
