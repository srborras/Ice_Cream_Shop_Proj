class Job < ApplicationRecord
    
    #Callbacks
    #before_destroy :make_inactive
    
    #Relations
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    #Validations
    validates_presence_of :name
    
    #Scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }
    
    #Callback code
    private
    
    def make_inactive
        self.active = false
    end
    
    
end
