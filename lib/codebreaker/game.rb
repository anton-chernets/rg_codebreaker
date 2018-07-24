module Codebreaker
  # Codebreaker is a logic game in which a code-breaker tries to break a code
  class Game
    JSON_SCORE_FILE = 'score.json'
    AMOUNT_NUMBERS = 4
    AMOUNT_ATTEMPTS = 5
    AMOUNT_HINT = 1

    def initialize
      @configuration ||= GameConfiguration.new
      yield @configuration if block_given?
      @amount_nums = AMOUNT_NUMBERS
      @attempts = AMOUNT_ATTEMPTS
      @current_attempts = AMOUNT_ATTEMPTS
      @hint = AMOUNT_HINT
      @secret_code = generates_secret_code
    end

    def submits_guess(given_code)
      @current_attempts = decrement_by_one(@current_attempts)
      if full_match(string_convert_to_array(given_code))
        true
      elsif @current_attempts <= 0
        false
      else
        partial_match(string_convert_to_array(given_code)).to_s
      end
    end

    def gives_hint
      if @hint > 0
        hint = ''
        @amount_nums.times { hint << '*' }
        index = rand(@amount_nums)
        hint[index] = @secret_code[index].to_s
        @hint = decrement_by_one(@hint)
        hint
      else
        false
      end
    end

    def preparation_information
      result = {}
      result[:name] = @configuration.player_name.to_s
      result[:score] = @current_attempts
      result[:code] = @secret_code
      result[:date] = Date.today.to_s

      dump = []
      dump = reading_information if reading_information
      dump << result
    end

    def recording_information(dump)
      File.open(JSON_SCORE_FILE, 'w') do |file|
        true if file.write(JSON.generate(dump))
      end
    end

    def reading_information
      JSON.parse(File.read(JSON_SCORE_FILE)) if File.exist? JSON_SCORE_FILE
    end

    private

    def full_match(given_code_arr)
      instance_variable_get('@secret_code') == given_code_arr
    end

    def partial_match(given_code_arr)
      result = ''

      given_code_arr.each_with_index do |value, index|
        char = ''
        char = '-' if @secret_code.include? value
        char = '+' if @secret_code[index] == value
        result += char
      end

      result
    end

    def decrement_by_one(num)
      num - 1
    end

    def string_convert_to_array(str)
      str.chars.map(&:to_i)
    end

    def generates_secret_code
      instance_variable_set('@secret_code', [*1..6].sample(@amount_nums))
    end
  end
end
