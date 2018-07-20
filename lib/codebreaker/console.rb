require 'bundler/setup'
require 'codebreaker'

# When a new game was started, the game generates secret code.
module Console
  def self.start_game
    @@game = Codebreaker::Game.new do |configuration|
      puts 'Enter your name'
      introduced = gets.chomp
      case introduced
      when /^[а-яА-ЯёЁa-zA-Z0-9]+$/
        configuration.player_name = introduced
      else
        puts 'Input is not correct'
        start_game
      end
    end

    puts 'The game generates secret code of 4 numbers from 1 to 6'
    puts 'Еry guessing the number'
    puts 'Press h for request a hint.'

    user_interface
  end

  def self.user_interface
    introduced = gets.chomp
    case introduced
    when /^[1-6]{#{4}}$/
      attempts_to_guess(introduced)
    when /h/
      request_hint
    else
      puts 'Input is not correct'
      user_interface
    end
  end

  def self.attempts_to_guess(given_code)
    game_over_message = 'Game is over'
    result = @@game.submits_guess(given_code)
    if result.is_a? String
      puts result
      puts 'Try again'
      user_interface
    elsif result === true
      puts '++++'
      saves_result
      puts game_over_message
      plays_again
    else
      saves_result
      puts game_over_message
      plays_again
    end
  end

  def self.request_hint
    result = @@game.gives_hint
    if result
      puts 'System reveals one of the numbers in the secret code: '
      puts result
      user_interface
    else
      puts 'Sorry, no more hint available'
      user_interface
    end
  end

  def self.saves_result
    puts 'Wanna save information about the game? (y/n)'
    introduced = gets.chomp
    if introduced == 'y'
      if @@game.recording_information(@@game.preparation_information)
        puts 'Information about the game saved '
      else
        puts 'oops we have error'
        saves_result
      end
    elsif introduced == 'n'
      puts 'Information about the game NOT saved'
    else
      puts 'Input is not correct'
      saves_result
    end
  end

  def self.plays_again
    puts 'Wanna play again? (y/n)'
    introduced = gets.chomp
    if introduced == 'y'
      start_game
    elsif introduced == 'n'
      puts 'The system shuts down'
    else
      puts 'Input is not correct'
    end
  end
end

Console.start_game
