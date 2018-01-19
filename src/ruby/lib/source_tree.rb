require_relative 'rvdata2'

SCRIPT_LINE = Struct.new(:id, :title, :content)

class Source_Tree
  attr_reader :raw_tree
  attr_reader :seed

  def self.from_file(file)
    marshalled = Rvdata2.load(file)
    Source_Tree.new(marshalled)
  end

  def initialize(rvdata_tree)
    @raw_tree = rvdata_tree
    setup_seed
  end

  def fresh_seed
    @seed += 1
    @seed
  end

  def [](key)
    value =
      if key.is_a?(String)
        @raw_tree.find{|k| k[1] == key}
      else
        @raw_tree[key]
      end
    render_line(value)
  end

  def render
    @raw_tree.map{ |line| render_line(line) }
  end

  private

  def render_line(line)
    content = Rvdata2.inflate(line[2])
    SCRIPT_LINE.new(line[0], line[1], content)
  end

  def setup_seed
    max = @raw_tree.max_by { |line| line[0] || 0 }
    @seed = max.first
  end

end
