module Util
  extend self

  def result(is_ok, message, payload)
    "{ok: #{!!is_ok}, message: #{message}, payload: #{payload}}"
  end

  def error(message)
    result(false, '"' + message + '"', "null")
  end

  def succeed(data)
    result(true, '""', data)
  end

end
