require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) { build(:message) }

  it { is_expected.to validate_presence_of(:body) }
end
