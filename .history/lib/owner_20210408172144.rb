class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.filter{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map{|dog| dog.mood="happy"}
  end

  def feed_cats
    self.cats.map{|cat| cat.mood="happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each{|pet| 
      pet.mood="nervous"
      pet.owner=nil
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end