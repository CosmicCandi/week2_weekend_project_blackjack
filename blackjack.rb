# Deliverables
# A repo containing at least:
# blackjack.rb : your game class
# card.rb : your Card class
# deck.rb : your Deck class
# card_test.rb : Tests for your card class
# deck_test.rb : Tests for your deck class


# Requirements
# You should create classes for your data, and use methods instead of having one big loop

### Explorer Mode ###
# Don't consider Aces as possible 1's ... they are always 11s (this means you can bust on the deal)
# This is a 2 hand game (dealer and player)
# no splitting or funny business
# 1 deck in the game
# 52 card deck
# NO WILDS
# New deck every game
# deck must be shuffled every game
# no betting at all
# must have suits (ace of diamonds)
# Dealer hits if less than 16, otherwise dealer stays
# You enter what you play (hit or stay)
# No if you get 5 cards you win funnybusiness
# get as close to 21 without going over
# Must beat the dealer
# you can see 1 of dealers cards, while you are playing and both when your hand is over.
# If you get blackjack, you win automagically
# Ties go to the player

### Adventure Mode ###
# You win if you have 6 cards and stay under 21
# Dealer wins if it draws blackjack before any player actions
# Ties go to the hand with the most cards, if still tied, it goes to the player

### Epic Mode ###
# Add the idea of tracking your progress as you play over time.
# Let the player choose if an Ace is a 1 or an 11, or do it automatically.
# Add 7 decks to the game in a "Shoe", shuffle them all together, deal from the "Shoe"

### Legendary Mode ###
# Tests for the game itself.
# Support for splitting.
# Have an advisor along the way that optionally gives a hint to the play on their best move.
# Additional Resources

require_relative 'deck.rb'
require_relative 'card.rb'
require 'tty'
require 'pry'

class Game

  attr_accessor :player1,
                :player2,
                :p1_current_card,
                :p2_current_card,
                :rounds,
                :ties

  def initialize
    @player1 = Deck.new
    @player2 = Deck.new
    @p1_current_card = p1_current_card
    @p2_current_card = p2_current_card
    @rounds = 0
    @ties = 0

  end

  prompt = TTY::Prompt.new

  while prompt.yes?("Would you like to play a game of War?")

    player1 = Deck.new
    player2 = Deck.new

    puts "This is Player 1's deck"
    puts player1.inspect
    binding.pry
    puts "========================"
    puts "\n"
    puts "This is Player 2's deck"
    puts player2.inspect

  end

  def new_game
  end

  def draw_a_card
    #Setup arrays to collect the winning cards.
    #This will be used later to declare the winner.
    player1_winnings = []
    player2_winnings = []

    #Setup arrays to collect the discarded cards in case of a tie
    discard = []


    #Setup arrays to hold the current card for each player for comparison
    #Each card will be pushed out of the array after it's been compared
    self.p1_current_card = []
    self.p2_current_card = []
    self.p1_current_card << player1.draw_a_card
    self.p2_current_card << player2_draw_a_card
  end

  def compare_cards
   if p1_current_card > p2_current_card
     player1_winnings << p1_current_card
     player1_winnings << p2_current_card
   elsif p1_current_card < p2_current_card
     player2_winnings << p1_current_card
     player2_winnings << p2_current_card
   else
     discard << p1_current_card
     discard << p2_current_card
   end
  end

  def end_game
  end

  def round_counter
  end

end
