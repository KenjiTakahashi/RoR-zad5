require 'spec_helper'

describe StudentsController do
  describe "index" do
    it "should render index" do
      get :index
      response.should render_template("index")
    end
    it "should have 3 entries for 'students'" do
      Student.make!(5)
      get :index
      assigns(:students).size.should eq(3)
    end
  end
end
