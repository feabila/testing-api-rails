require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to(:author) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end