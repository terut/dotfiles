if defined? Rails::Console
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveResource::Base.logger = Logger.new(STDOUT)
  # use hirb
  #if defined? Hirb
  #  Hirb.enable
  #end
end

