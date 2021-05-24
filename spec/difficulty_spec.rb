RSpec.describe Codebreaker::Difficulty do
  let(:difficulties) { Codebreaker::Difficulty::DIFFICULTIES }
  let(:valid_difficulties) { difficulties.keys.map(&:to_s) }

  describe 'New entity of Difficulty class' do
    let(:empty_array) { [] }

    it do
      valid_difficulties.each do |difficulty|
        instance_difficulty = described_class.new(difficulty)

        expect(instance_difficulty.level).to eq(difficulties[difficulty.to_sym])
        expect(instance_difficulty.instance_variable_get(:@errors)).to eq(empty_array)
      end
    end
  end

  describe 'valid difficulties' do
    Codebreaker::Difficulty::DIFFICULTIES.keys.map(&:to_s).each do |valid_difficulty|
      it "when #{valid_difficulty} difficulty" do
        instance_difficulty = described_class.new(valid_difficulty)
        instance_difficulty.validate

        expect(instance_difficulty.errors).to be_empty
        expect(instance_difficulty.valid?).to be_truthy
      end
    end
  end

  describe 'invalid difficulties' do
    let(:errors_array) { [I18n.t('errors.wrong_difficulty')] }
    let(:invalid_difficulty) { 'invalid' }

    it 'validation is broken for difficulty' do
      instance_difficulty = described_class.new(invalid_difficulty)
      instance_difficulty.validate
      
      expect(instance_difficulty.errors).to match_array(errors_array)
      expect(instance_difficulty.valid?).to be_falsey
    end
  end
end
