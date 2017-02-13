# Deliverables
# A repo containing at least:
# blackjack.rb : your game class
# deck.rb : your Deck class
require 'pry'
require_relative 'deck'
require 'tty'
include Comparable
# card_test.rb : Tests for your card class
# deck_test.rb : Tests for your deck class

# Requirements
# You should create classes for your data,
# and use methods instead of having one big loop
class Blackjack
  attr_accessor :deck, :p1_hand, :dealer_hand, :hand_total, :hit_stand, :busted, :catchphrase

  def initialize
    @deck = Deck.new
    @p1_hand = []
    @dealer_hand = []
    @prompt = TTY::Prompt.new
    @hand_total = hand_total
    @hit_stand = hit_stand
    @busted = false

    build_hands

  end

  def build_hands
    2.times do
      @p1_hand << deck.draw_a_card
    end
    #Used to test winner condition 1 on line 109 below
    # @p1_hand << Card.new("Diamonds", 2)
    # @p1_hand << Card.new("Hearts", 2)
    # @p1_hand << Card.new("Clubs", 2)
    # @p1_hand << Card.new("Spades", 2)
    # @p1_hand << Card.new("Hearts", 3)
    # @p1_hand << Card.new("Spades", 3)
    2.times do
      @dealer_hand << deck.draw_a_card
    end
  end

  def total_hands(player)
    hand_total = player.map(&:value).reduce(:+)
  end

  def play
    show_player_hand
    if total_hands(p1_hand) == 21 || total_hands(dealer_hand) == 21
      winner
    elsif total_hands(p1_hand) > 21
      @busted = true
      loser
    else
      show_dealer_last
      player_turn
    end
  end

  def show_player_hand
    puts 'Player 1 Hand: '
    puts "You have #{p1_hand.join(' and ')}."
    puts "Your hand total is: #{total_hands(p1_hand)}"
    puts '==============='
  end

  def player_turn
      if total_hands(p1_hand) == 21
        winner
      elsif total_hands(p1_hand) <= 21
        hit_or_stand
        show_dealer_last
      else
        loser
        return busted
      end
  end

  def show_dealer_last
    puts "Dealer is showing #{dealer_hand.last}"
    # puts "Debugging: Dealer's Hand total is: #{total_hands(dealer_hand)}"
    puts '==============='
  end

  def show_dealer_all
    puts "Dealer is showing #{dealer_hand.join(' and ')}."
    puts "The dealer's hand totals #{total_hands(dealer_hand)}."
  end

  def dealer_turn
    until total_hands(dealer_hand) >= 16 do
      if total_hands(dealer_hand) > 21
        @busted = true
        loser
      else
        dealer_hand << deck.draw_a_card
        puts "The dealer is drawing a card..."
        show_dealer_all
      end
    end
  end

  def winner
    catchphrase = "You win with #{total_hands(p1_hand)}!"
    if total_hands(p1_hand) <= 21 && p1_hand.length == 6
      puts "We've just witnessed a miracle! #{p1_hand.length} cards and no bust! I can't believe you ended with a total of #{total_hands(p1_hand)}!"
      puts " (╯°□°）╯︵ ┻━┻ YOU WINNNNNN!"
      new_game?
    elsif total_hands(p1_hand) > total_hands(dealer_hand)
      puts catchphrase
      new_game?
    elsif total_hands(p1_hand) == 21
      puts "BLACKJACK! #{catchphrase}"
      new_game?
    elsif total_hands(p1_hand) == total_hands(dealer_hand)
      deal_with_ties
      new_game?
    elsif total_hands(dealer_hand) > total_hands(p1_hand)
        if total_hands(dealer_hand) > 21
          loser
        else
          puts "The dealer wins with #{total_hands(dealer_hand)}!"
          new_game?
        end
    end
  end

  def loser
    catchphrase = "You win with #{total_hands(p1_hand)}!"
    if total_hands(p1_hand) > 21
      puts "Oh no! You busted! Better luck next time!"
      new_game?
    elsif total_hands(dealer_hand) > 21
      puts "The dealer busted with #{total_hands(dealer_hand)}! #{catchphrase}"
      new_game?
    end
  end

  def deal_with_ties
    if p1_hand.length > dealer_hand.length
      puts "You and the dealer tied, but you won with #{p1_hand.length} cards and a hand total of #{total_hands(p1_hand)}."
    elsif dealer_hand.length > p1_hand.length
      puts "You and the dealer tied, but the dealer won with #{dealer_hand.length} cards and a hand total of #{total_hands(dealer_hand)}."
    else
      puts "You and the dealer tied, but hand totals were also tied! You won with #{p1_hand.length} cards and a hand total of #{total_hands(p1_hand)}"
    end
  end

  def hit_or_stand
    hit_stand = @prompt.yes?("Would you like to hit?")
    if hit_stand
      p1_hand << deck.draw_a_card
      total_hands(p1_hand)
      show_player_hand
      player_turn
      hit_stand = true
    else
      hit_stand = false
      dealer_turn
      winner
    end
  end

  def new_game?
    play_again = @prompt.yes?("Would you like to play again?")
      if play_again
        Blackjack.new.play
      else
        exit
      end
  end

#End of Class
end
Blackjack.new.play

### Explorer Mode ###
# Don't consider Aces as possible 1's ... they are always 11s
# (this means you can bust on the deal)
# This is a 2 hand game (dealer and player)
# no splitting or funny business
# 1 deck in the game
# 52 card deck
# NO WILDS
# New deck every game
# deck must be shuffled every game
# no betting at all
# must have suits (ace of diamonds) = Working
# Dealer hits if less than 16, otherwise dealer stays = Working
# You enter what you play (hit or stay) = Working
# No if you get 5 cards you win funnybusiness
# get as close to 21 without going over = Working
# Must beat the dealer = Working
# you can see 1 of dealers cards, while you are playing and both when your hand is over. = Working
# If you get blackjack, you win automagically = Working
# Ties go to the player = Working

### Adventure Mode ###
# You win if you have 6 cards and stay under 21
# Dealer wins if it draws blackjack before any player actions  = Tested and working
# Ties go to the hand with the most cards, if still tied, it goes to the player - Tested and working

### Epic Mode ###
# Add the idea of tracking your progress as you play over time.
# Let the player choose if an Ace is a 1 or an 11, or do it automatically.
# Add 7 decks to the game in a "Shoe", shuffle them all together, deal from the "Shoe"

### Legendary Mode ###
# Tests for the game itself.
# Support for splitting.
# Have an advisor along the way that optionally gives a hint to the play on their best move.
# Additional Resources
