require 'spec_helper'

describe Building do 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:architect) }
  it { should belong_to(:architect) }
  it { should have_and_belong_to_many(:users) }
  
end