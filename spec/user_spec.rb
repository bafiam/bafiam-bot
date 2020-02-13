require_relative '../app/lib/users.rb'
require_relative './dump_data.rb'
require 'json'

RSpec.describe Users do
  let(:user_data) { Users.new }
  let(:run) { user_data.output }
  let(:test_data) { JSON.parse(Testdata.run_data) }
  let(:user_with_data) { Users.new(test_data) }
  let(:run_all_users_name) { user_with_data.all_users_name }
  describe '#initialize' do
    context 'when initialized' do
      it 'returns an empty hash' do
        expect(run.empty?).to eql true
      end
      it 'returns a hash' do
        expect(run.class).to eql Hash
      end
    end
  end
  describe '#all_users_name' do
    context 'when given data' do
      it 'return email and name' do
        output_expected_one = 'wathigosimon : wathigosimon@gmail.com'
        output_expected_zero = 'stevebafiam : stevebafiam@gmail.com'
        expect(run_all_users_name[0]).to eql output_expected_zero
        expect(run_all_users_name[1]).to eql output_expected_one
      end
    end
  end
end
