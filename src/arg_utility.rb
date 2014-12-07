require_relative 'config'

module ArgUtility
  include GlobalConfig

  def valid_args?(args)
    return false if args.size != 2
    return (VALID_OPERATIONS.include?(args[0]) && 
            VALID_DIFFICULTIES.include?(args[1]))
  end

  def usage_info 
    USAGE
  end
end
