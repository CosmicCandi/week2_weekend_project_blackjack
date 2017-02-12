class Card

  include Comparable

  def self.suits
    %w(Diamonds Clubs Hearts Spades)
  end

  def self.faces
    ("2".."10").to_a + %w(Jack Queen King Ace)
  end

  attr_accessor :suit, :face, :value

  def initialize(suit, face)
    self.suit = suit
    self.face = face
    self.value = find_value
  end

  def find_value
    # Face to Integer != 0 face.to_i == face
    if face.to_i != 0
      face.to_i
    elsif face == "Ace"
      11
    else
      10
    end
  end

  def to_s
    if face == "Ace"
      "an #{face} of #{suit}"
    elsif face == 8
      "an #{face} of #{suit}"
    else
      "a #{face} of #{suit}"
    end
  end

  def <=>(other)
    if other.is_a? Card
      value <=> other.value
      else
        super(other)
    end
  end

end

# Testing to see that new card objects had the proper value
# player1_card1 = Card.new("Spades","2")
# player1_card2 = Card.new("Diamonds", "Ace")
# player1_card3 = Card.new("Hearts", "King")
# player1_card4 = Card.new("Clubs", 8)
# puts player1_card1.inspect
# puts player1_card1.declaration
# puts player1_card2.inspect
# puts player1_card2.declaration
# puts player1_card3.inspect
# puts player1_card3.declaration
# puts player1_card4.inspect
# puts player1_card4.declaration
