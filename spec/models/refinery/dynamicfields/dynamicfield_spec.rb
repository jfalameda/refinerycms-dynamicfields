require 'spec_helper'

module Refinery
  module Dynamicfields
    describe Dynamicfield do
      describe "validations" do
        subject do
          FactoryGirl.create(:dynamicfield)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
