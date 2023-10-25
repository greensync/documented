module Documented
  class Renderer
    def initialize(gem_path, output_path)
      @gem_path = gem_path
      @output_path = output_path
    end

    # Place files in output path.
    def render()
      filenames = [
        "README.md",
      ]

      filenames.each do |filename|
        file = File.read(File.join(@gem_path, "output", filename))
        File.open(File.join(@output_path, filename), 'w+') do |f|
          f.write file
        end
      end

      file = File.read(File.join(@gem_path, "output", "gitignore.txt"))
      File.open(File.join(@output_path, ".gitignore"), 'w+') do |f|
        f.write file
      end
    end
  end
end
