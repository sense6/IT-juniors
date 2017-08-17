require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    it "responds successfully with an HTTP 200 status code" do
      subject
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the companies into @companies" do
      company_1 = create(:company)
      company_2 = create(:company)

      subject


      expect(assigns(:companies)).to match_array([company_1, company_2])
    end
  end

  describe "GET #show/:id" do
    it "responds successfully with an HTTP 200 status code" do
      company = Company.create!(name: "company name inna")
      get :show, params: { id: company.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
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
