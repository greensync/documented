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
      calls = ['Start']

      return TracePoint.new(:call, :return) do |trace_point|
        caller = calls.last.to_s
        callee = trace_point.defined_class.to_s
        event = trace_point.event
    
        unless @blocklist.any? { |e| callee.to_s.start_with? e }
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
            @sequence << "#{caller}->>#{callee}: #{trace_point.method_id}"
          end
        end
      end
    end
  end
end
