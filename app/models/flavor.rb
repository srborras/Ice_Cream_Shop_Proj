class Flavor < ApplicationRecord
    
    # Callbacks
    # before_destroy :make_inactive
    
    # Relations
    has_many :store_flavors
    has_many :stores, through: :store_flavors
    
    # Validations
    validates_presence_of :name
    
    # Scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }
    
    # Callback code
    private
    
    def make_inactive
        self.active = false
    end
    
end
