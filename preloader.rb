require 'yaml'
require 'i18n'
require 'config/i18n'

Dir[File.join(__dir__, 'lib/Codebreaker/**/*.rb')].sort.each { |file| require file }
