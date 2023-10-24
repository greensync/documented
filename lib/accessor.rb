################################################################################
# Access variables via one object to avoid polluting the caller's scope.
#
# @pattern Singleton
################################################################################

module Documented
  class Accessor
    attr_accessor :initialized
    attr_accessor :error

    attr_accessor :config
    attr_accessor :renderer

    attr_accessor :package_path
    attr_accessor :project_path
    attr_accessor :output_path

    def initialize()
      @initialized = false
      @error = nil

      @config = nil
      @renderer = nil

      @package_path = nil
      @project_path = nil
      @output_path = nil
    end
  end
end