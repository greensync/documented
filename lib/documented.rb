require 'set'
require 'erb'

require_relative 'accessor'
require_relative 'config'
require_relative 'renderer'

module Documented
  def documented
    events = []
    calls = ['Start']
  
    trace = TracePoint.new(:call, :return) do |tp|
      # file = File.open("#{__dir__}/../../doc/diagrams/input.mmd")
      # file.write("sequenceDiagram\n")
  
      # file.close
      caller = calls.last.to_s
      callee = tp.defined_class.to_s
      event = tp.event
  
      unless blocklist.any? { |e| callee.to_s.start_with? e }
        unless calls.last == callee
          if event == :return
            calls.pop
          elsif calls.last != callee
            calls << callee
          end
        end
  
        unless callee == caller
          caller = caller.gsub('::','.')
          callee = callee.gsub('::','.')
          p "#{caller}->>#{callee}: #{tp.method_id}"
        end
      end
    end
  
    trace.enable
  
    yield
  
    trace.disable
  
    ap events
  end

  def self.configure
    documented_setup_class()

    yield(@@documented.config)
  end

  def self.included(base)
    documented_setup_class()
  end

  private

  ##
  # Setup class.
  #
  # @paths
  #   - package_path [String] Absolute path to the library itself.
  #   - project_path [String] Absolute path to the project root.
  #   - output_path [String] Absolute path to the documented directory.
  ##
  def self.documented_setup_class()
    @@documented = Accessor.new()
    @@documented.config = Config.new()

    # Setup paths.
    @@documented.package_path = File.dirname(File.realpath(__FILE__))
    @@documented.project_path = @@documented.config.project_path
    @@documented.output_path = File.join(@@documented.project_path, @@documented.config.output_directory)
    unless Dir.exist? @@documented.output_path
      Dir.mkdir(@@documented.output_path)
    end

    @@documented.renderer = Renderer.new(@@documented.package_path, @@documented.output_path)
  end
end
