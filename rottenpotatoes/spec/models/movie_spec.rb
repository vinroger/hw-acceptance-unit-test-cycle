require 'rails_helper'

RSpec.describe Movie, type: :model do
  before :each do
    @movie1 = Movie.create!(title: 'Star Wars', rating: 'PG', director: 'George Lucas', release_date: '1977-05-25')
    @movie2 = Movie.create!(title: 'Blade Runner', rating: 'R', director: 'Ridley Scott', release_date: '1982-06-25')
    @movie3 = Movie.create!(title: 'THX-1138', rating: 'R', director: 'George Lucas', release_date: '1971-03-11')
  end

  describe '.same_director' do
    it 'should find movies by the same director' do
      expect(Movie.same_director('George Lucas')).to include(@movie1, @movie3)
      expect(Movie.same_director('George Lucas')).to_not include(@movie2)
    end

    it 'should not find movies by different directors' do
      expect(Movie.same_director('Ridley Scott')).to include(@movie2)
      expect(Movie.same_director('Ridley Scott')).to_not include(@movie1, @movie3)
    end
  end

end
