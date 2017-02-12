require 'minitest/autorun'
require './card.rb'
require './deck.rb'
require 'pry'

class Deck_Test < MiniTest::Test

  def setup
  end

  # A deck has 52 cards
  def test_a_deck_has_52_cards
    deck = Deck.new
    assert_equal 52, deck.cards.length
  end

  # A deck contains 13 of each suit
  #Unable to get this functionality working.
  def test_a_deck_contains_13_of_each_suit
    suit_count = []
    player1 = Deck.new
    card_sample = player1.cards.select {|suit| suit.suit == "Diamonds"}
    assert card_sample.length == 13
  end

  # A deck contains four of each face of cards
  def test_a_deck_contains_four_of_each_face_of_cards
    face_count = []
    player1 = Deck.new
    face_count = player1.cards.select {|face| face.face == "King"}
    assert face_count.length == 4
  end

  # A deck is shuffled on creation
  def test_a_deck_is_shuffled_on_creation
    deck1 = Deck.new
    deck2 = Deck.new
    refute_equal deck1.cards, deck2.cards
  end

  # A deck can be drawn, and once a card is drawn, the deck has one less card in it
  def test_a_card_can_be_drawn_and_no_longer_resides_in_the_deck
    deck1 = Deck.new
    deck1.draw_a_card
    assert_equal 51, deck1.cards.length
  end

end
