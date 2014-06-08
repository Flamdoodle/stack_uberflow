require_relative '../spec_helper'

describe QuestionsController do  

	describe "GET #index" do 
		it "show a list of all questions" do 
			# total = Questions.all.count
			get :index
			# expect(response).to eq total 
		end
		
		it "render the :index template" do 
			get :index
			expect(response).to render_template :index
		end
	end


	describe "GET #show" do 
		it "shows one specific user" do 
			# user = FactoryGirl.build(:user)
			question = Question.create(user_id: 1, title: "What is rails?", body: "this is it")
			get :show, id: question 
			expect(assigns(:question)).to eq question 
		end

		it "render the :show template" do 
			question = Question.create(user_id: 1, title: "What is rails?", body: "this is it")
			get :show, id: question 
			expect(response).to render_template :show 
		end
	end

end