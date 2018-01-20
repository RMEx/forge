require_relative 'lib/util'
require_relative 'lib/project'

def main(path)
  begin
    project = Project.new(path)
    return Util.succeed(project.to_json)
  rescue StandardError => e
    return Util.error(e.message)
  end
end

print main(ARGV.first)
