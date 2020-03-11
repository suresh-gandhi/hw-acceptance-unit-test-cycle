=begin
require 'rails_helper'

RSpec.describe Movie, type: :model do

  before(:each) do
    @movie1 = Movie.create(title: "a", director: "P1")
    @movie2 = Movie.create(title: "b", director: "P1")
    @movie3 = Movie.create(title: "c", director: "P1")
    @movie4 = Movie.create(title: "d")
  end

  describe 'director methods test for model in before(:each)' do
    it 'should return similar movie' do
      Movie.similar_movies(@movie1[:id], {director: @movie1[:director]}).should == [@movie2, @movie3]
    end

    it 'should return empty relation' do
      Movie.similar_movies(@movie4[:id], {director: @movie4[:director]}).should == []
    end
  end
end
=end