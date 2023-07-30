# spec/helpers/movies_helper_spec.rb
require 'rails_helper'

RSpec.describe MoviesHelper, type: :helper do
  describe "#oddness" do
    it "returns 'odd' when count is an odd number" do
      expect(helper.oddness(3)).to eq("odd")
    end

    it "returns 'even' when count is an even number" do
      expect(helper.oddness(4)).to eq("even")
    end
  end
end
