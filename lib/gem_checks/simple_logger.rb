class SimpleLogger
  LOG_LEVELS = [:debug, :info, :warn, :error, :fatal, :unknown]

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

  def level=(level)
    @level = level
  end

  private

  def log_if_level_valid(level_sym)
    if @level <= LOG_LEVELS.index(level_sym)
      log
    end
  end

  def log(*)
    print '.'
  end
end
