FactoryGirl.define do
  factory :category do
    name 'BOOKS'
  end

  factory :event do
    name 'Cook the books'
    start '12/12/12 12:12'
  end

  # factory :done_task, :class => :event do
  #   name 'finish the job'
  #   association :list, :factory => :list
  # end
end