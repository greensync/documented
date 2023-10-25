require_relative './cat'
require_relative './dog'
require_relative './place'

# You only need to require Documented when you configure it.
# require_relative '../lib/documented'
# Documented.configure do |config|
#   config.blocklist = config.blocklist + [
#     'ExampleClass',
#   ]
# end

# documented:enable

# They meet on a city street.
street = Place.new("City Street")
cat = Cat.new()
cat.meow("Hi there dog")
dog = Dog.new()
dog.bark("Hello cat")

# They are friendly to each other.
if cat.is_friendly()
  # They fall in love.
  cat.fall_in_love(dog)
  dog.fall_in_love(cat)

  # Their family don't approve.
  FATHER_WHO_NEVER_APPROVES = "I disapprove of your romance and everything!"
  MOTHER_WHO_MAYBE_APPROVES = "I am also pretty critical of new boyfriends."

  cat.meow("Hi mum and dad, this is the love of my life!")
  dog.bark("Nice to meet you folks!")
  puts FATHER_WHO_NEVER_APPROVES
  puts MOTHER_WHO_MAYBE_APPROVES

  # They run away together.
  places = []
  places << Place.new("Paris")
  places << Place.new("Berlin")
  places << Place.new("Madrid")
else
  # They part ways.
end

# documented:disable
