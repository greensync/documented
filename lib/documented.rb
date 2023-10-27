require_relative './config'
require_relative './tracer'

module Documented
  class << self
    def setup()
      @@config = Config.new
      @@tracer = Tracer.new(@@config.blocklist)

      output_path = File.join(@@config.app_path, @@config.output_directory)
      Dir.mkdir(output_path) unless Dir.exist? output_path

      @@renderer = Renderer.new(@@config.gem_path, output_path)

      self
    end

    def config
      @@config
    end

    def tracer
      @@tracer
    end

    # Allow end-user to override config.
    def configure
      yield(@@config)
    end
  end
end
