require 'spec_helper'

describe Building do 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:architect) }
  
end