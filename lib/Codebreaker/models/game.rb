module Codebreaker
  class Game
    attr_reader :hints_total, :attempts_total, :attempts_left, :hints_left

    RANGE_OF_DIGITS = (1..6).freeze
    SECRET_CODE_LENGTH = 4
    GUESSED_SYMBOL = '+'.freeze
    NOT_GUESSED_SYMBOL = '-'.freeze

    def initialize(difficulty)
      super()
      @attempts_total = @attempts_left = difficulty.level[:attempts]
      @hints_total = @hints_left = difficulty.level[:hints]
    end

    def guess(user_value)
      @user_code = user_value.chars.map(&:to_i)
      handle_user_code
      @attempts_left -= 1
      @round_result.empty? ? nil : @round_result
    end

    def handle_user_code
      numbers_with_incorrect_position = check_numbers_for_correct_position
      @round_result = GUESSED_SYMBOL * numbers_with_incorrect_position.select(&:nil?).size
      @user_code.compact.map do |number|
        next unless numbers_with_incorrect_position.compact.include?(number)

        @round_result += NOT_GUESSED_SYMBOL
        numbers_with_incorrect_position[numbers_with_incorrect_position.index(number)] = nil
      end
    end

    def hints
      @hints ||= secret_code.uniq.shuffle.take(@hints_total)
    end

    def secret_code
      @secret_code ||= generate_code
    end

    def active_game
      @active_game ||= true
    end

    def take_a_hint
      @hints_left -= 1
      hints.pop
    end

    def win?(guess)
      secret_code.join == guess
    end

    def lose?
      @attempts_left.zero?
    end

    def hints_used
      @hints_total - @hints_left
    end

    def attempts_used
      @attempts_total - @attempts_left + 1
    end

    private

    def generate_code
      Array.new(SECRET_CODE_LENGTH) { rand(RANGE_OF_DIGITS) }
    end

    def check_numbers_for_correct_position
      secret_code.map.with_index do |element, index|
        next element unless element == @user_code[index]

        @user_code[index] = nil
      end
    end
  end
end
