require 'spec_helper'

# Testing the Codebreaker module - Game class
module Codebreaker
  RSpec.describe GameConfiguration do
    describe '#initialize' do
      context 'new object' do
        it 'should be child of Struct' do
          expect(subject.class.superclass).to eq(Struct)
        end
      end
    end
  end

  RSpec.describe Game do
    let(:game) {
      Game.new do |configuration|
        configuration.player_name = 'Test'
      end
    }

    let(:amount_nums) { game.instance_variable_get(:@amount_nums) }

    describe '#initialize' do
      context 'new object' do
        it "is available as #{described_class}" do
          expect(described_class).to eql(Game)
        end
      end
    end

    describe '#start' do
      it 'saves secret code array according to the settings' do
        expect(game.instance_variable_get(:@secret_code).size).to eq amount_nums
      end

      specify { expect(game.instance_variable_get(:@secret_code).size).to eq(amount_nums) }

      it 'saves secret code with numbers from 1 to 6' do
        expect(game.instance_variable_get(:@secret_code).to_s).to match(/[1-6]+/)
      end

      describe '#play' do # context если <0, >0, true, false
        before(:each) do
          game.instance_variable_set('@secret_code', [4, 4, 5, 5])
        end

        it 'correct hint format' do
          expect(game.gives_hint).to match /^[1-6*]{#{amount_nums}}$/
        end

        get_codes.each do |hash|
          it "make a guess when secret code is #{hash[:secret_code]} and guess code is #{hash[:code]}" do
            game.instance_variable_set(:@secret_code, hash[:secret_code].to_i.digits.reverse)
            expect(game.submits_guess(hash[:code])).to eq hash[:res]
          end
        end

        it 'wins game' do
          expect(game.submits_guess('4455')).to be true
        end

        context "#finish" do
          context '#saves_score' do
            after(:all) do
              File.delete('score.json')
            end

            it 'record information return true' do
              expect(game.recording_information(game.preparation_information)).to be true
            end
          end
        end
      end
    end
  end
end
