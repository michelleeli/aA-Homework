require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cheesecake) {Dessert.new("cheesecake", 1, "Boyardee")}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do 
      expect(cheesecake.type).to eq('cheesecake')
    end 

    it "sets a quantity" do 
      expect(cheesecake.quantity).to eq(1)
    end 

    it "starts ingredients as an empty array" do 
      expect(cheesecake.ingredients).to eq([])
    end 

    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new('cheesecake','one','Boyardee')}.to raise_error(ArgumentError)
    end 
  end

  describe "#add_ingredient" do
    before(:each) {cheesecake.add_ingredient("milk")}
    it "adds an ingredient to the ingredients array" do 
      expect(cheesecake.ingredients).to include("milk")
    end 
  end

  describe "#mix!" do
    before(:each) { cheesecake.add_ingredient("sugar")}
    before(:each) { cheesecake.add_ingredient("cream cheese")}
    before(:each) { cheesecake.add_ingredient("flour")}
    it "shuffles the ingredient array" do 
      expect(cheesecake.ingredients[0]).to_not eq(cheesecake.mix![0])
    end 
  end

  describe "#eat" do
    before(:each) {cheesecake.eat(1)}
    it "subtracts an amount from the quantity" do
      expect(cheesecake.quantity).to eq(0)
    end 

    it "raises an error if the amount is greater than the quantity" do
      expect{cheesecake.eat(5)}.to raise_error("not enough left!")
    end 
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(cheesecake.serve).to eq(chef.titleize)
    end 
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"  
      # expect(chef).to receive(:bake).with(cheesecake)
      # cheesecake.make_more
  end
end