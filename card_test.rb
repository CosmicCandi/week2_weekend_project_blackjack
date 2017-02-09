require 'minitest/autorun'
require './card.rb'

class Card_Test < MiniTest::Test

  def setup
    @card1 = Card.new("Hearts", 3)
    @card2 = Card.new("Diamonds", 4)
    @card3 = Card.new("Spades", 10)
    @card4 = Card.new("Clubs", "Jack")
    @card5 = Card.new("Spades", "Queen")
    @card6 = Card.new("Clubs", "King")
    @card7 = Card.new("Clubs", "Ace")
  end

  # A Card has a suit, face and value
  def test_card_has_a_suit
    assert @card1.suit != nil
  end

  def test_card_has_a_face
    assert @card2.face != nil
  end

  def test_card_has_a_value
    refute @card3 == nil
  end

  def test_a_card_has_a_value
    # A Jack has a value of 11
    assert @card4.value == 10
    # A Queen has a value of 12
    assert @card5.value == 10
    # A King has a value of 13
    assert @card6.value == 10
    #An Ace has a value of 11
    assert @card7.value == 11

  end

  # Cards can be directly compared using > and <
  def test_two_cards_can_be_directly_compared
    assert @card1.value < @card2.value
    assert @card2.value > @card1.value
    assert @card3.value == @card4.value
    assert @card4.value > @card1.value
    assert @card5.value == @card4.value
  end

  def test_two_cards_can_be_added_together
    assert @card1.value + @card2.value == 7
    assert @card2.value + @card5.value == 14
    assert @card3.value + @card4.value == 20
  end

end
