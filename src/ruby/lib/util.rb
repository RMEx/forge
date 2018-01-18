module Util
  extend self

  def result(is_ok, value)
    "{ok: #{!!is_ok}, data: #{value}}"
  end

  def error(message)
    result(false, '"' + message + '"')
  end

  def succeed(data)
    result(true, data)
  end

end
