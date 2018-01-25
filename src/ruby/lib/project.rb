require 'json'
require_relative 'rpgmaker'
require_relative 'source_tree'

class Project
  attr_reader :path
  attr_reader :game_system
  attr_reader :info

  def initialize(path)
    @path = path
    check_path
    setup_data
  end

  def to_json
    {
      "path": @path,
      "name": @info[:name],
      "version": @info[:version].to_s,
      "titlescreens": build_titles,
      "scripts": build_scripts
    }
  end

  def game_rvproj2
    file(['Game.rvproj2'])
  end

  def data_scripts
    file(['Data', 'Scripts.rvdata2'])
  end

  def data_system
    file(['Data', 'System.rvdata2'])
  end

  def tree(force = false)
    @tree = setup_tree if !@tree || force
    @tree
  end

  private

  def build_scripts
     tree.titles
  end

  def build_title(key)
    obj = @game_system.send("title#{key}_name")
    real_path = @path + "/Graphics/Titles#{key}/#{obj}.png"
    if obj && !obj.empty?
      f = File.exist?(real_path)
      {path: f ? real_path : "Titles#{key}/#{obj}.png", isRTP: !f}
    end
  end

  def build_titles
    [1, 2].map {|x| build_title(x)}.compact
  end

  def setup_tree
    Source_Tree.from_file(data_scripts)
  end

  def setup_data
    @game_system = Rvdata2.load(data_system)
    @info = {
      name: @game_system.game_title,
      version: @game_system.version_id
    }
  end

  def file(members)
    subpath = File.join(members)
    File.expand_path(subpath, @path)
  end

  def check_path
    unless File.exist?(game_rvproj2)
      raise "Not a RPGMaker project [#{@path}]"
    end
  end

end
