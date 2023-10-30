require 'rubocop'
require_relative './config'

module Documented
  class Rewriter
    attr_accessor :file_path
    attr_accessor :source
    attr_accessor :tree

    def initialize(file_path)
      @file_path = file_path
      @source = RuboCop::ProcessedSource.new(File.read(file_path), 3)
      @tree = Parser::Source::TreeRewriter.new(@source.buffer)
    end

    def require_library(lib_path)
      setup = <<-RUBY
        \n require "#{lib_path}"
        Documented.setup("#{@file_path}")
      RUBY
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

    def execute
      system("#{command(file_path)} #{temp_file_path}")
    end

    def write
      File.write(temp_file_path, @tree.process)
    end

    def delete
      File.delete(temp_file_path)
    end

    private

    def temp_file_path
      file_name = 'tmp-' + File.basename(@file_path)
      directory = File.dirname(file_path)
      File.join(directory, file_name)
    end

    def command(file_path)
      return 'bundle exec rspec' if file_path.end_with?('_spec.rb')
      return 'bundle exec cucumber' if file_path.end_with?('.feature')
    
      'ruby'
    end
  end
end
