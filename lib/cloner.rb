module Documented
  class Cloner
    class << self
      def clone(directory_path:, file_paths: [])
        file_paths.each do |file_path|
          file_contents = File.open(file_path)
          File.write(temp_file_path(directory_path:, file_path:), file_contents)
        end
      end

      def temp_file_path(directory_path:, file_path:)
        file_name = File.basename(file_path)
        directory = directory_path.split('/').reject(&:empty?)
        directory_level_up = directory.pop

        File.join(directory, "#{directory_level_up}_tmp", file_name)
      end
    end
  end
end
