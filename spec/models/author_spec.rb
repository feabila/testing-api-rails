require 'rails_helper'

RSpec.describe Author, type: :model do
  # Association test
  # ensure Author model has a 1:m relationship with the Book model
  it { should have_many(:books).dependent(:destroy) }
  
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end
