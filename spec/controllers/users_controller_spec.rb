require_relative '../spec_helper'

describe UsersController do
  let!(:user) { create :user }

  context "#new" do
    it "is successful" do
      get :new, id: user
      expect(response).to be_success
    end

    it "creates a new instance of User" do
      get :new, id: user
      expect(assigns(:user)).to be_a User
    end

    it "renders the login page" do
      get :new, id: user
      expect(response).to render_template :new
    end
  end

  context "#create" do
    it "with valid attributes" do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "with invalid attributes" do
      expect {
        post :create, user: attributes_for(:invalid_user)
      }.to_not change{ User.count }
    end

    it "redirects to root path" do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to root_path
    end
  end

  context "#login" do
    it "with valid credentials" do
      user = User.create(username: "controllertest", password: "test")
      expect {
        post :login, user: {username: "controllertest", password: "test"}
        assigns(session[:user_id])
      }.to_not be_nil
    end

    it "with invalid credentials" do
      post :login, user: attributes_for(:invalid_user)
      expect(session[:user_id]).to be_nil
    end

    it "redirects to root path" do
      user = User.create(username: "controllertest", password: "test")
      post :login, user: {username: "controllertest", password: "test"}
      expect(response).to redirect_to root_path
    end
  end

  context "#end" do
    it "clears the current session" do
      get :end
      expect(session[:user_id]).to be_nil
    end

    it "redirects to root path" do
      get :end
      expect(response).to redirect_to root_path
    end
  end
end