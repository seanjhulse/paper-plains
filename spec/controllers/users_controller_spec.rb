require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET index" do

    it "assigns @users" do
      user = create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      # all users have permission for the index of Users

      user = create(:user)
      get :index
      expect(response).to render_template("index")
    end

  end

  describe "GET new" do 
    it "allows super_administrators" do
      user = create(:user, role: :super_administrator)
      get :new, params: { id: User.first.id }
      expect(response).to render_template("new")
    end

    it "disallows administrators" do
      user = create(:user, role: :administrator)
      get :new, params: { id: User.first.id }
      
      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows employees" do
      user = create(:user, role: :employee)
      get :new, params: { id: User.first.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows guests" do
      user = create(:user, role: :guest)
      get :new, params: { id: User.first.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end
  end

  describe "GET edit" do 
    it "allows super_administrators" do
      user = create(:user, role: :super_administrator)
      get :edit, params: { id: User.first.id }
      expect(response).to render_template("edit")
    end

    it "disallows administrators" do
      user = create(:user, role: :administrator)
      get :edit, params: { id: User.first.id }
      
      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows employees" do
      user = create(:user, role: :employee)
      get :edit, params: { id: User.first.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows guests" do
      user = create(:user, role: :guest)
      get :edit, params: { id: User.first.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end
  end

  describe "POST create" do 
    it "allows super_administrators" do
      user = create(:user, role: :super_administrator)
      created_user = attributes_for(:user)

      post :create, params: { user: created_user }
      expect(response.code).to eq('200')
    end

    it "disallows administrators" do
      user = create(:user, role: :administrator)
      created_user = attributes_for(:user)

      post :create, params: { user: created_user  } 

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows employees" do
      user = create(:user, role: :employee)
      created_user = attributes_for(:user)

      post :create, params: { user: created_user  }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows guests" do
      user = create(:user, role: :guest)
      created_user = attributes_for(:user)

      post :create, params: { user: created_user  }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end
  end

  describe "POST update" do 
    it "allows super_administrators" do
      user = create(:user, role: :super_administrator)
      created_user = attributes_for(:user)

      post :update, params: { id: User.first.id, user: created_user  }
      expect(response).to redirect_to(user_path(User.first))
    end

    it "disallows administrators" do
      user = create(:user, role: :administrator)
      created_user = attributes_for(:user)

      post :update, params: { id: User.first.id, user: created_user  }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows employees" do
      user = create(:user, role: :employee)
      created_user = attributes_for(:user)

      post :update, params: { id: User.first.id, user: created_user  }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows guests" do
      user = create(:user, role: :guest)
      created_user = attributes_for(:user)

      post :update, params: { id: User.first.id, user: created_user  }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end
  end

  describe "POST destroy" do 
    it "allows super_administrators" do
      user = create(:user, role: :super_administrator)

      post :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_url)
    end

    it "disallows administrators" do
      user = create(:user, role: :administrator)

      post :destroy, params: { id: user.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows employees" do
      user = create(:user, role: :employee)
      post :destroy, params: { id: user.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end

    it "disallows guests" do
      user = create(:user, role: :guest)

      post :destroy, params: { id: user.id }

      # We redirect to root path because of the settings in /app/controllers/concerns/Permissions.rb
      expect(response.code).to eq('403')
    end
  end

end
