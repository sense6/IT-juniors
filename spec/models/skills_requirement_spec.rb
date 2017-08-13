require 'rails_helper'

RSpec.describe SkillsRequirement, type: :model do
  describe "validations" do
    it { should validate_presence_of(:offer) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:technology) }
  end

  describe "associations" do
    it { is_expected.to belong_to :offer }
  end
end
