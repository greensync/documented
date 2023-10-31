require 'set'
require 'erb'

require_relative 'config'
require_relative 'renderer'

module Documented
  class Tracer
    attr_reader :sequence

    def initialize(blocklist)
      @blocklist = blocklist
      @trace_point = create_trace_point()
    end

    def enable
      @sequence = []
      @trace_point.enable
    end
    
    def disable
      @trace_point.disable
      Documented.add_sequence(@sequence)
    end

    private

    def create_trace_point
      calls = []

      return TracePoint.new(:call, :return) do |trace_point|
        callee = trace_point.self.class.to_s

        next if @blocklist.any? do |class_name|
          callee.start_with?(class_name) || trace_point.defined_class.to_s.start_with?(class_name)
        end

        calls << callee if calls.empty?
        caller = calls.last.to_s
        next if trace_point.method_id == :initialize && caller == callee && !@sequence.empty?

        event = trace_point.event

        unless calls.last == callee
          if event == :return
            calls.pop
          elsif calls.last != callee
            calls << callee
          end
        end
  
        caller.gsub!('::','.')
        callee.gsub!('::','.')
        event = "#{caller}->>#{callee}: #{trace_point.method_id}"

        next if @sequence.last == event

        @sequence << event
      end
    end
  end
end
