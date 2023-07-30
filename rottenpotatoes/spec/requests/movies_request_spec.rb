
# spec/requests/movies_request_spec.rb
require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:movie) { Movie.create!(title: "Test Movie", rating: "PG", release_date: Date.today, description: "Test Description", director: "Test Director") }

  describe "GET /show" do
    it "returns http success" do
      get movie_path(movie.id)
      expect(response).to have_http_status(:success)
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get movies_path
      expect(response).to have_http_status(:success)
      expect(assigns(:movies)).to eq([movie])
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_movie_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new movie" do
      movie_params = { title: "New Movie", rating: "PG", release_date: Date.today, description: "New Description", director: "New Director" }
      post movies_path, movie: movie_params 
      expect(flash[:notice]).to eq("\"New Movie\" was successfully created.")
      expect(response).to redirect_to(movies_path)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_movie_path(movie.id)
      expect(response).to have_http_status(:success)
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe "PATCH /update" do
    it "updates the movie" do
      movie_params = { title: "Updated Movie" }
      patch movie_path(movie.id), params: { movie: movie_params }
      expect(flash[:notice]).to eq("\"Updated Movie\" was successfully updated.")
      expect(response).to redirect_to(movie_path(movie))
      movie.reload
      expect(movie.title).to eq("Updated Movie")
    end
  end

  describe "DELETE /destroy" do
    it "deletes the movie" do
      delete movie_path(movie.id)
      expect(flash[:notice]).to eq("Movie 'Test Movie' deleted.")
      expect(response).to redirect_to(movies_path)
    end
  end

  describe "GET /same_director" do
    it "returns http success" do
      get same_director_path(movie.id)
      expect(response).to have_http_status(:success)
      expect(assigns(:movies)).to eq([movie])
    end
  end
end
