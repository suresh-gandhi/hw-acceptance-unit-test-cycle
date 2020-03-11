require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  
    context 'when movie has director' do
        it 'renders same director page' do
            movie_1 = Movie.create(:title => "Dark Knight", :director => "Christopher Nolan")
            movie_2 = Movie.create(:title => "Joker", :director => "Todd Phillips")

            get :similar, :id => movie_1

            expect(response).to render_template("similar")
        end
    end

    context 'when movie has no director' do
        it 'renders index page' do
            movie_1 = Movie.create(:title => "Dark Knight")

            get :similar, :id => movie_1

            expect(response).to redirect_to('/movies')
            expect(flash[:notice]).to eq("\'Dark Knight\' has no director info")
        end
    end
    
    
    context "when home page is called" do
        it "renders index page" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    context "edit movie page is called" do
        it "renders edit page" do
            movie_1 = Movie.create(:title => "Interstellar", :director => "Christopher Nolan")
            get :edit, :id => movie_1
            expect(response).to render_template("edit")
        end
    end
    
    
    
    context 'show Movie' do
        it 'renders show details page' do
            movie_1 = Movie.create(:title => "Interstellar", :director => "Christopher Nolan")
            get :show, :id => movie_1
            expect(response).to render_template("show")
            
        end
    end
    
    context 'Delete a Movie' do
        it 'flashes delete message' do
            movie_1 = Movie.create(:title => "Inception", :director => "Christopher Nolan")
            get :destroy, :id => movie_1
            expect(response).to redirect_to(movies_path)
            expect(flash[:notice]).to eq("Movie \'Inception\' deleted.")
        end
    end
    
    
    
end