require 'zlib'

module Rvdata2
  extend self

  def load(file)
    raise "invalid file [#{file}]" unless File.exist?(file)
    File.open(file, 'r') do |binaries|
      Marshal.load(binaries)
    end
  end

  def inflate(marshalled)
    Zlib::Inflate.inflate(marshalled)
  end

end
