class Animal
  def initialize()
    @in_love = false
  end

  def talk(sound)
    puts sound
  end

  def is_friendly()
    true
  end

  def fall_in_love(animal)
    @in_love = true
    @lover = animal
  end

  def disobey_parents
    # TODO.
  end

  ##
  # @param animal [Animal] The other animal to run away with.
  ##
  def run_away(animal)
    # TODO.
  end
end
