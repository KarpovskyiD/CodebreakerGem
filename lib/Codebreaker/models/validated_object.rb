module Codebreaker
  class ValidatableObject
    def initialize
      @errors = []
    end

    def valid?
      validate
      @errors.empty?
    end

    def validate
      raise NotImplementedError
    end
  end
end
