module Documented
  class Renderer
    def initialize(gem_path, output_path)
      @gem_path = gem_path
      @output_path = output_path
    end

    def render(file_path)
      # file_names = [
      #   "README.md",
      # ]
      # file_names.each do |file_name|
      #   file = File.read(File.join(@gem_path, "output", file_name))
      #   File.open(File.join(@output_path, file_name), 'w+') do |f|
      #     f.write file
      #   end
      # end

      Documented.sequences.each do |sequence|
        file_name = File.basename(file_path, File.extname(file_path)) + '.md'
        directory = File.join(@output_path, file_name)

        output = <<~TEXT
          ```mermaid
          sequenceDiagram;
          #{sequence.map { |step| "  #{step}" }.join("\n")}
          ````
        TEXT

        File.write(directory, output)
      end
    end
  end
end
