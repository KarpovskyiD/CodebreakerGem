require 'pry'
module Codebreaker
  class Difficulty < ValidatedObject
    attr_reader :name, :errors, :difficulty

    DIFFICULTIES = {
      easy: { difficulty: 'easy', attempts: 15, hints: 2 },
      medium: { difficulty: 'medium', attempts: 10, hints: 1 },
      hard: { difficulty: 'hard', attempts: 5, hints: 1 }
    }.freeze

    def initialize(difficulty)
      super()
      @difficulty = DIFFICULTIES[difficulty.to_sym]
    end

    def validate
      @errors << I18n.t('errors.wrong_difficulty') if difficulty_nil?
    end

    private

    def difficulty_nil?
      @difficulty.nil?
    end
  end
end
