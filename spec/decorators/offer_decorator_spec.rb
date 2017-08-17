require 'rails_helper'

RSpec.describe OfferDecorator do
  describe '#salary' do
    subject { offer.decorate.salary }

    context 'salary is in usd' do
      let(:usd_currency) { create(:currency, :usd) }
      let!(:offer) { create(:offer, salary_min: 2000, salary_max:4000, currency: usd_currency) }
      it { is_expected.to eq("2000$ - 4000$") }
    end
  end

  describe '#short_desc' do
    subject { offer.decorate.short_desc(12) }

    context 'description is too long' do
      let!(:offer) { create(:offer, description: 'lorem ipsum dolor') }
      it { is_expected.to eq("lorem ipsum...") }
    end

    context 'description is shorter than limit' do
      let!(:offer) { create(:offer, description: 'lorem enum') }
      it { is_expected.to eq("lorem enum") }
    end
  end
end
