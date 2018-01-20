require 'json'

module Util
  extend self

  def result(is_ok, message, payload)
    h = {"ok": is_ok, "message": message, "payload": payload}
    JSON.generate(h)
  end

  def error(message)
    result(false, message, nil)
  end

  def succeed(data)
    result(true, '', data)
  end

end
