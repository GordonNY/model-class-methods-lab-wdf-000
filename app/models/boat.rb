class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    Boat.all.sort[0..4]
  end

  def self.dinghy
    Boat.where('length < ?', 20)
  end

  def self.ship
    Boat.where('length > ?', 20)
  end

  def self.last_three_alphabetically
    all = Boat.all.sort {|x,y| x.name <=> y.name}
    all[(all.length - 3)..all.length].sort
  end

  def self.without_a_captain
    Boat.where('captain_id is NULL')
  end

  def self.sailboats
    Boat.joins(:classifications).where(classifications: {name: 'Sailboat'})
  end

  def self.with_three_classifications
    Boat.all.select {|boat| boat.classifications.count >= 3}
  end

  def self.longest
    Boat.order('length DESC').first
  end
end
