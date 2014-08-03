require 'rails_helper'

describe Service do
  let(:service) { Service.create!(name: "Blue Bottle Coffee", classification: classification) }
  let(:location) { Location.create!(name: "Manhattan") }
  let(:classification) { Classification.create!(name: "Hipster Coffee Shop", path: "coffee_shop.hipster") }

  describe "#comp_lions_in?" do
    subject { service.comp_lions_in?(location) }

    context "when the service's classification has no comp" do
      it { should be_falsey }
    end

    context "when the service's classification has a comp" do
      context "in the specified location" do
        before { Comp.create!(classification: classification, location: location, percentage: 50) }
        it { should be_truthy }
      end

      context "in a different location" do
        let(:other_location) { Location.create!(name: "Staten Island") }
        before { Comp.create!(classification: classification, location: other_location, percentage: 50) }
        it { should be_falsey }
      end
    end

    context "when the service's classification's parent has a comp" do
      let(:parent_classification) { Classification.create!(name: "Coffee Shop", path: "coffee_shop") }

      context "in the specified location" do
        before { Comp.create!(classification: parent_classification, location: location, percentage: 50) }
        it { should be_truthy }
      end

      context "in a different location" do
        let(:other_location) { Location.create!(name: "Staten Island") }
        before { Comp.create!(classification: parent_classification, location: other_location, percentage: 50) }
        it { should be_falsey }
      end
    end

    context "when the service's classification has a child classification with a comp" do
      let(:child_classification) { Classification.create!(name: "Moustaches Required", path: "coffee_shop.hipster.moustache") }
      before { Comp.create!(classification: child_classification, location: location, percentage: 50) }
      it { should be_falsey }
    end
  end

  describe "#comp_percentage_in" do
    subject { service.comp_percentage_in(location) }
    let(:percentage) { 50 }

    context "when the service's classification has no comp" do
      it { should be_nil }
    end

    context "when the service's classification has a comp" do
      before { Comp.create!(classification: classification, location: location, percentage: percentage) }
      it { should == percentage }
    end

    context "when the service's classification's parent has a comp" do
      let(:parent_classification) { Classification.create!(name: "Coffee Shop", path: "coffee_shop") }
      before { Comp.create!(classification: parent_classification, location: location, percentage: percentage) }
      it { should == percentage }
    end

    context "when the service's classification has a comp, and the parent classification has a comp" do
      let(:parent_classification) { Classification.create!(name: "Coffee Shop", path: "coffee_shop") }
      before do
        Comp.create!(classification: classification, location: location, percentage: percentage)
        Comp.create!(classification: parent_classification, location: location, percentage: parent_percentage)
      end

      context "and the parent classification has a higher comp percentage" do
        let(:parent_percentage) { percentage + 10 }
        it { should == parent_percentage }
      end

      context "and the parent classification has a lower comp percentage" do
        let(:parent_percentage) { percentage - 10 }
        it { should == percentage }
      end
    end
  end
end

