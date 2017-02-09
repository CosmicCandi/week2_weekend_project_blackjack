require './card.rb'

class Deck

  attr_accessor :cards

  def initialize
    deck_building
    shuffle_up_and_deal
  end

  def deck_building
    suits = ["Clubs", "Hearts", "Diamonds", "Spades"]
    faces = (2..10).to_a + %w(Jack Queen King Ace)

    self.cards = []
    suits.each do |suit|
      faces.each do |face|
        cards << Card.new(suit, face)
      end
    end

  end

  def shuffle_up_and_deal
    cards.shuffle!
  end

  def draw_a_card
    cards.shift
  end

end
