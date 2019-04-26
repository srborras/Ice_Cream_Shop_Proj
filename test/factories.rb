FactoryBot.define do
 
  factory :employee do
    first_name { "Ed" }
    last_name { "Gruberman" }
    ssn { rand(9 ** 9).to_s.rjust(9,'0') }
    date_of_birth { 19.years.ago.to_date }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    role { "employee" }
    active { true }
  end
  
  factory :store do
    name {"CMU"}
    street {"5000 Forbes Avenue"}
    city {"Pittsburgh"}
    state {"PA"}
    zip {"15213"}
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active {true}
  end
  
  factory :assignment do
    association :store
    association :employee
    start_date {1.year.ago.to_date}
    end_date {1.month.ago.to_date}
    pay_level {1}
  end
  
  factory :shift do
    association :assignment
    # Check Date.now syntax
    date {1.weeks.ago.to_date}
    start_time {Time.now}
    end_time {Time.now + (3*60*60)}
    notes {"None"}
  end
  
  factory :flavor do
    name {"Chocolate"}
    active {true}
  end
  
  factory :storeflavor do
    association :store
    association :flavor
  end
  
  factory :user do
    association :employee
    email {"egrub@gmail.com"}
    password_digest {"5ebe2294ecd0e0f08eab7690d2a6ee69"}
  end
  
  factory :job do
    name {"Prep food"}
    description {"Prepare the food to be sold"}
    active {true}
  end
  
  factory :shiftjob do
    association :shift
    association :job
  end
  

end