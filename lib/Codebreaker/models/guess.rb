require 'preloader'

module Codebreaker
  class Guess < ValidatedObject
    attr_reader :guess_code, :errors

    RANGE_OF_GUESS_DIGIT_VALUE = (1..6).freeze

    def initialize(user_answer)
      super()
      @user_answer = user_answer
    end

    def validate
      return if hint?

      @errors << failing.secret_code_length unless valid_user_answer?
    end

    def hint?
      @user_answer == 'hint'
    end

    private

    def valid_user_answer?
      @user_answer =~ /^[1-6]{4}$/
    end
  end
end
