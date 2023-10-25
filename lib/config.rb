module Documented
  class Config
    attr_accessor :blocklist
    attr_accessor :duplicates
    attr_accessor :app_path
    attr_accessor :gem_path
    attr_accessor :output_directory

    def initialize()
      @blocklist = [
        '#<Class:Bundler',
        '#<Class:#<Class',
        '#<Class:0x0000',
        '#<Class:Cucumber',
        '#<Class:JSON>',
        '#<Class:Net::',
        '#<Class:Time',
        '#<Class:URI::Generic>',
        '#<Class:URI>',
        '#<Module',
        '#<refinement',
        'BasicSocket',
        'Bundler',
        'Cucumber',
        'Datadog',
        'Float',
        'Helpers',
        'Integer',
        'Kernel',
        'Net::',
        'NilClass',
        'Set',
        'Thread',
        'Timeout::Request',
        'TracePoint',
        'URI::',
        'URI::Generic',
      ]

      @duplicates = false

      @app_path = Dir.pwd
      @gem_path = File.dirname(File.realpath(__FILE__))

      @output_directory = "documented"
    end
  end
end