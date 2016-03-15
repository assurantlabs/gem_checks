require 'gemnasium/gemnasium_client'

class VulnerableVersionCheck
  def call(deps)
    deps.select { |gem| vulnerable?(gem) }
  end

  private

  def vulnerable?(gem)
    gemnasium_client.vulnerable?(gem)
  end

  def gemnasium_client
    GemnasiumClient.new
  end
end
