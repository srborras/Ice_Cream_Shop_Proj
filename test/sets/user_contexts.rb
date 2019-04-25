module Contexts
  module UserContexts
      
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed)
      @cindy_user = FactoryBot.create(:user, employee: @cindy, email: "cindy@gmail.com")
      @ben_user = FactoryBot.create(:user, employee: @ben, email: "ben10@gmail.com")
      @kathryn_user = FactoryBot.create(:user, employee: @kathryn, email: "kathy@gmail.com")
      @alex_user = FactoryBot.create(:user, employee: @alex, email: "alex@gmail.com")
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ben_user.destroy
      @kathryn_user.destroy
      @alex_user.destroy
    end
  end
end