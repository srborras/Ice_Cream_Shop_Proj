class Flavor < ApplicationRecord
    
    # Callbacks
    before_destroy :stop_destroy
    after_rollback :make_inactive
    
    # Relations
    has_many :storeflavors
    has_many :stores, through: :storeflavors
    
    # Validations
    validates_presence_of :name
    
    # Scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }
    
    # Methods
    def stop_destroy
        self.errors.add(:base, "Cannot delete a Flavor!")
        throw(:abort)
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
    
end
