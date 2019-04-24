module Contexts
  module FlavorContexts
      
    def create_flavors
      @choco = FactoryBot.create(:flavor)
      @vanilla = FactoryBot.create(:flavor, name: "Vanilla")
      @cc = FactoryBot.create(:flavor, name: "Cookies & Cream")
      @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: false)
      @mango = FactoryBot.create(:flavor, name: "Mango", active: false)
    end
    
    def remove_flavors
        @choco.destroy
        @vanilla.destroy
        @cc.destroy
        @strawberry.destroy
        @mango.destroy
    end
    
  end
end