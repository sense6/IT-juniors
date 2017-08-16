require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:technology) }
  end

  describe "associations" do
    it { is_expected.to belong_to :user }
  end
end
