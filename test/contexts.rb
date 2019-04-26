# require needed files

require './test/sets/store_contexts'
require './test/sets/employee_contexts'
require './test/sets/assignment_contexts'
require './test/sets/shift_contexts'
require './test/sets/flavor_contexts'
require './test/sets/storeflavor_contexts'
require './test/sets/user_contexts'
require './test/sets/job_contexts'
require './test/sets/shiftjob_contexts'

module Contexts
    # explicitly include all sets of contexts used for testing 
    include Contexts::StoreContexts
    include Contexts::EmployeeContexts
    include Contexts::AssignmentContexts
    include Contexts::ShiftContexts
    include Contexts::FlavorContexts
    include Contexts::StoreflavorContexts
    include Contexts::UserContexts
    include Contexts::JobContexts
    include Contexts::ShiftjobContexts
  
end