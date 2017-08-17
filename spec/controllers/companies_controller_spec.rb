require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the companies into @companies" do
      company1, company2 = Company.create!(name: "company name"), Company.create!(name: "test name")
      get :index

      expect(assigns(:companies)).to match_array([company1, company2])
    end
  end

  describe "GET #show/:id" do
    it "responds successfully with an HTTP 200 status code" do
      company = Company.create!(name: "company name")
      get :show, params: { id: company.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
