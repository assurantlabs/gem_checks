class SimpleLogger
  attr_writer :level

  LOG_LEVELS = [:debug, :info, :warn, :error, :fatal, :unknown].freeze

  def initialize(default_level: :debug)
    @level = LOG_LEVELS.index(default_level)
  end

  def debug(*)
    log_if_level_valid(:debug)
  end

  def info(*)
    log_if_level_valid(:info)
  end

  def warn(*)
    log_if_level_valid(:warn)
  end

  def error(*)
    log_level_if_valid(:error)
  end

  def fatal(*)
    log_level_if_valid(:fatal)
  end

  def unknown(*)
    log_level_if_valid(:unknown)
  end

  private

  def log_if_level_valid(level_sym)
    return unless @level <= LOG_LEVELS.index(level_sym)
    log
  end

  def log(*)
    print '.'
  end
end
