module Documented
  class Renderer
    def initialize(package_path, output_path)
      @package_path = package_path
      @output_path = output_path
    end

    # Place files in output path.
    def render()
      filenames = [
        "README.md",
      ]

      filenames.each do |filename|
        file = File.read(File.join(@package_path, "output", filename))
        File.open(File.join(@output_path, filename), 'w+') do |f|
          f.write file
        end
      end

      file = File.read(File.join(@package_path, "output", "gitignore.txt"))
      File.open(File.join(@output_path, ".gitignore"), 'w+') do |f|
        f.write file
      end
    end
  end
end
