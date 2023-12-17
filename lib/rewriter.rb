require 'rubocop'
require_relative './config'

module Documented
  class Rewriter
    class ParseError < StandardError; end

    attr_accessor :file_path
    attr_accessor :source
    attr_accessor :tree

    def initialize(file_path)
      @file_path = file_path
      @source = RuboCop::ProcessedSource.new(File.read(file_path), 3)
      @tree = Parser::Source::TreeRewriter.new(@source.buffer)
    end

    def require_library(gem_path)
      setup = <<-RUBY
        \n require "#{gem_path}/lib/documented"
        Documented.setup("#{@file_path}")
      RUBY

      raise ParseError, "Can't build Abstract Syntax Tree" if @source.ast.nil?

      @tree.insert_after(@source.ast.children.first.loc.expression, setup)
    end

    def replace_comments
      @source.comments.each do |comment|
        range = comment.location.expression
      
        if comment.text.start_with?('# documented:enable')
          @tree.replace(range, "Documented.enable")
        elsif comment.text.start_with?('# documented:disable')
          @tree.replace(range, "Documented.disable")
        end
      end
    end

    def write(file_path)
      File.write(file_path, @tree.process)
    end

    def delete(file_path)
      File.delete(file_path)
    end
  end
end
