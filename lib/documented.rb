require_relative './config'
require_relative './tracer'
require_relative './renderer'

module Documented
  class << self
    def setup(file_path)
      @@file_path = file_path
      @@config = Config.new
      @@tracer = Tracer.new(@@config.blocklist)

      output_path = File.join(@@config.app_path, @@config.output_directory)
      Dir.mkdir(output_path) unless Dir.exist? output_path
      @@renderer = Renderer.new(@@config.gem_path, output_path)

      @@sequences = []
    end

    def enable
      @@tracer.enable 
    end

    def disable
      @@tracer.disable
      @@renderer.render(@@file_path)
    end

    def sequences
      @@sequences
    end

    def add_sequence(sequence)
      @@sequences << sequence
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
