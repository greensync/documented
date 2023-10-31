require_relative 'animal'

class Cat < Animal
  def meow(message)
    message = message.to_s.downcase + "eeow!"
    talk(message)
  end

  def is_friendly()
    true
  end
end
