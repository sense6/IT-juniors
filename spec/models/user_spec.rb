require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
  end

  describe "associations" do
    it do
      is_expected.to have_many(:skills).dependent(:destroy)
    end
  end
end
