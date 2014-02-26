require 'spec_helper'

describe Architect do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:style) }

end