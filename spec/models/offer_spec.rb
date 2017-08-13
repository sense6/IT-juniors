require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:role) }
  end

  describe "associations" do
    it { is_expected.to belong_to :company }
    it { is_expected.to belong_to :role }
  end
end
