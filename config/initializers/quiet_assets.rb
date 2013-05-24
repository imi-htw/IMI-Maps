if Rails.env.development?

  #Rails.application.assets.logger = Logger.new('/dev/null')
  logger = nil
  if File.exists?('/dev/null')
    logger = Logger.new('/dev/null')
  else
    logger = Logger.new('logger.txt')
  end
  Rails.application.assets.logger = logger

  Rails::Rack::Logger.class_eval do
    def call_with_quiet_assets(env)
      previous_level = Rails.logger.level
      Rails.logger.level = Logger::ERROR if env['PATH_INFO'] =~ %r{^/assets/}
      call_without_quiet_assets(env)
    ensure
      Rails.logger.level = previous_level
    end
    alias_method_chain :call, :quiet_assets
  end
end