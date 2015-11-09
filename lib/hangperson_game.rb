class HangpersonGame
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def initialize(word)
    validate_string(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(guess)
    validate_string(guess)
    local_guess = guess.downcase
    if self.guesses.include?(local_guess) || self.wrong_guesses.include?(local_guess)
      false
    else
      if self.word.include?(local_guess)
        self.guesses << local_guess
      else
        self.wrong_guesses << local_guess
      end
      check_win_or_lose
    end
  end

  def check_win_or_lose
      return :lose if self.guesses.length + self.wrong_guesses.length == 7
      return :win if self.guesses.length >= self.word.length
      return :play
  end

  def validate_string(string)
    raise ArgumentError.new "Parameters must be a valid string" if string.nil? || string.match(/^[a-zA-Z]+$/).nil?
  end
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
