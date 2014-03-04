require 'spec_helper'

describe Architect do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:style) }
  it { should have_many(:buildings) }
  it { should have_and_belong_to_many(:users) }

  describe "#self.search" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }

    it "searches in the database for an architect by the same name" do
      expect(Architect.search("Frank Lloyd Wright")).to eq(frank)
    end
  end

end