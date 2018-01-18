require_relative 'lib/util'
require_relative 'lib/project'

def main(path)
  begin
    project = Project.new(path)
    Util.succeed(true)
  rescue StandardError => e
    return Util.error(e.message)
  end
end

p main(ARGV.first)
