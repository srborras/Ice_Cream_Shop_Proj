module Contexts
  module UserContexts
      
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed, password_digest: "5b5fb84bae7cdcfdbe72615460b26bee")
      @cindy_user = FactoryBot.create(:user, employee: @cindy, email: "cindy@gmail.com", password_digest: "5ebe2294ecd0e0f08eab7690d2a6ee69")
      @ben_user = FactoryBot.create(:user, employee: @ben, email: "ben10@gmail.com", password_digest: "11f3c32a78232b58522f36150feb37e8")
      @kathryn_user = FactoryBot.create(:user, employee: @kathryn, email: "kathy@gmail.com", password_digest: "be95c6cc0e0a23212e10b2a2825d380c")
      @alex_user = FactoryBot.create(:user, employee: @alex, email: "alex@gmail.com", password_digest: "7b2f7244bb1734145d388005bf5af0be")
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