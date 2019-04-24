module Contexts
  module StoreflavorContexts
    # Context for stores 
    def create_storeflavors
        @cmu_choco = FactoryBot.create(:storeflavor, store: @cmu, flavor: @choco)
        @cmu_cc = FactoryBot.create(:storeflavor, store: @cmu, flavor: @cc)
        @oakland_vanilla = FactoryBot.create(:storeflavor, store: @oakland, flavor: @vanilla)
        @oakland_mango = FactoryBot.create(:storeflavor, store: @oakland, flavor: @mango)
        @hazelwood_strawberry = FactoryBot.create(:storeflavor, store: @hazelwood, flavor: @strawberry)
    end
    
    def remove_storeflavors
        @cmu_choco.destroy
        @cmu_cc.destroy
        @oakland_vanilla.destroy
        @oakland_mango.destroy
        @hazelwood_strawberry.destroy
    end
  end
end