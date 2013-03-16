require 'spec_helper'

describe Todo do
 context 'associations' do
    it {should have_many(:notes).dependent(:destroy)}
  end


  context '.not_done' do
    it 'returns only not done tasks' do
      not_done_todos = (1..5).to_a.map {|number| Todo.create(:name => "todo #{number}", :done => false)}
      done_todo = Todo.create(:name => "done todo", :done => true)
      Todo.not_done.should eq not_done_todos
    end
  end
end
