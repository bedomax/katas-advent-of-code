module FileHelper
  def self.read_file_to_array(path: , integer:false)
    data = File.readlines(path, chomp: true)
    data = data.map(&:to_i) if integer
    data
  end
  def self.read_file_with_separator(path:, separator:' ')
    File.read(path).split(separator)
  end
end