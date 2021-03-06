require 'spec_helper'

describe ReportsController do

  before do
    stub_sign_in
    @school = FactoryGirl.create(:school)
  end

  describe 'report of check ins' do

    before do
      @report = 1
    end

    it "finds check ins using the search params in the request" do
      CheckIn.should_receive(:search_by).with('from', 'to', 1)

      get :index, from: 'from', to: 'to', school_id: 1, report: 1
    end

    it "finds check ins using todays dates if no search params exist" do
      todays_date = Date.today
      formatted_date = todays_date.strftime('%m-%d-%Y')
      Date.stub(:today => todays_date)
      CheckIn.should_receive(:search_by).with(formatted_date, formatted_date, 1)

      get :index, school_id: 1 , report:1
    end
  end

end
