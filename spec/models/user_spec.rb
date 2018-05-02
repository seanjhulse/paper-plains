require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "super administrator" do
    
    it "is correctly validates super_administrator role" do
      # Returns a saved User instance
      user = create(:user, role: :super_administrator)
      
      expect(user.super_administrator?).to be true
      expect(user.administrator?).to be false
      expect(user.employee?).to be false
      expect(user.guest?).to be false
    end
  
  end
 
  context "administrator" do
    
    it "is correctly validates administrator role" do
      # Returns a saved User instance
      user = create(:user, role: :administrator)
      
      expect(user.administrator?).to be true
      expect(user.super_administrator?).to be false
      expect(user.employee?).to be false
      expect(user.guest?).to be false
    end
  
  end

  context "employee" do
    
    it "is correctly validates employee role" do
      # Returns a saved User instance
      user = create(:user, role: :employee)
      
      expect(user.employee?).to be true
      expect(user.super_administrator?).to be false
      expect(user.administrator?).to be false
      expect(user.guest?).to be false
    end
  
  end

  context "guest" do
    
    it "is correctly validates guest role" do
      # Returns a saved User instance
      user = create(:user, role: :guest)
      
      expect(user.guest?).to be true
      expect(user.super_administrator?).to be false
      expect(user.administrator?).to be false
      expect(user.employee?).to be false
    end
  
  end

  context "all users" do 

    it "validates presence of netid" do
      user = User.new(netid: '')

      expect(user).to_not be_valid
    end

    it "validates presence of email" do
      user = User.new(email: '')

      expect(user).to_not be_valid
    end

    it "validates presence of role" do
      user = User.new(role: '')

      expect(user).to_not be_valid
    end

    it "validates presence of netid, email, and role" do
      user = build(:user) # if this is failing, we probably have an issue in the factory

      expect(user).to be_valid
    end

    it "validates uniqueness of netid" do
      user1 = create(:user, netid: 'User1')
      user2 =  build(:user, netid: 'User1')

      expect(user1).to     be_valid
      expect(user2).to_not be_valid
    end

    it "validates uniqueness of email" do
      user1 = create(:user, email: 'user@gmail.com')
      user2 =  build(:user, email: 'user@gmail.com')

      expect(user1).to     be_valid
      expect(user2).to_not be_valid
    end

  end

end
