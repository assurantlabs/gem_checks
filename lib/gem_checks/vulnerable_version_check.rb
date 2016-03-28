require 'gem_checks/gemnasium_client'

class VulnerableVersionCheck
  def initialize(gemnasium_client: GemnasiumClient.new)
    @gemnasium_client = gemnasium_client
  end

  def call(deps)
    deps.select { |gem| vulnerable?(gem) }
  end

  private

  def vulnerable?(gem)
    @gemnasium_client.vulnerable?(gem)
  end
end
