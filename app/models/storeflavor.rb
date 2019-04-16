class Storeflavor < ApplicationRecord
    
    # Relations
    belongs_to :store
    belongs_to :flavor
    
end
