require_relative './config'
require_relative './tracer'

module Documented
  class << self
    def setup
      @@config = Config.new
      @@tracer = Tracer.new(@@config.blocklist)

      output_path = File.join(@@config.app_path, @@config.output_directory)
      Dir.mkdir(output_path) unless Dir.exist? output_path

      @@renderer = Renderer.new(@@config.gem_path, output_path)
    end

    def enable
      @@tracer.enable
      # TODO: @@schema.enable
    end

    def disable
      @@tracer.disable
      # TODO: @@schema.disable
    end

    def source
      @@source
    end

    def config
      @@config
    end

    # Allow end-user to override config.
    def configure
      yield(@@config)
    end
  end
end
