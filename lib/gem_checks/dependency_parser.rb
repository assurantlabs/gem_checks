class DependencyParser
  def parse(lockfile)
    lockfile.map { |line| parse_line(line) }.compact
  end

  private

  def parse_line(line)
    (match = line.match(GEM_PARSER)) ? parse_gem(match) : nil
  end

  def parse_gem(gem_str)
    { gem_name: gem_str[:gem_name], version: gem_str[:version] }
  end

  GEM_PARSER = /(?<gem_name>([a-zA-Z\-_0-9.])+)\s?\((?<version>(\d+\.?)+)\)/
end
