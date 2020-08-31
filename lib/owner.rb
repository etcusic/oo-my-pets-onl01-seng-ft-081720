require 'pry'

class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a human."
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)  
  end

  def walk_dogs
    @dogs.map{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    @cats.map{|cat| cat.mood = 'happy'}
  end

  def sell_pets
    @cats.map{|cat| cat.mood = 'nervous'; cat.owner = nil}
    @dogs.map{|dog| dog.mood = 'nervous'; dog.owner = nil}
    @cats.clear
    @dogs.clear
  end

  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end
end