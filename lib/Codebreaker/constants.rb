module Codebreaker
  module Constants
    WELCOME = 'Welcome'.freeze
    INSTRUCTION = "  Type 'start' for starting new game.
    Type 'stats' for showing statistics
    Type 'exit' for exit
    Type 'rules' for investigating the rules".freeze
    RULES = "You must guess the 4 digits number, each digit between 1 and 6.\n
            You receive '+' in otput if digit is correct and has correct place\n
            You receive '-' in output if digit presents in secret code. \n
            Type 'hint' if you want to get hint".freeze
    WIN = 'Mission complete! You win'.freeze
    LOSE = 'You lose'.freeze
    INVALID_NUMBER = 'Number is incorrect'.freeze
    NEW_GAME = 'Play once more? (y/n)'.freeze
    USERNAME = 'Please, type your Name'.freeze
    INCORRECT_USERNAME = 'User name is incorrect. It should be >3 and <20 symbols'.freeze
    BYE = 'Bye! Have a good day'.freeze
    COMMAND_ERROR = "You've selected incorrect command".freeze
    ASK_DIFFICULTY = 'Select difficulty easy, medium or hard'.freeze
    ROUND_QUESTION = 'Put the 4 digits. Attempts left - '.freeze
    NO_HINTS = 'There is no hints left'.freeze
    SAVE_SCORE = 'Do you wanns save the score(y/n)'.freeze
  end
end
