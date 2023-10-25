module Documented
  class << self
    def setup()
      @@config = Config.new()

      output_path = File.join(@@config.app_path, @@config.output_directory)
      Dir.mkdir(output_path) unless Dir.exist? output_path

      @@renderer = Renderer.new(@@config.gem_path, output_path)
    end

    # Allow end-user to override config.
    def configure
      yield(@@config)
    end
  end
end
