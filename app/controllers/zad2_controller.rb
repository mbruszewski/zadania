class Zad2Controller < ApplicationController
  def index
    if params[:text]
      @tekst = params[:text][:text1] if params[:text][:text1] 
      @tekst2 = params[:text][:text2] if params[:text][:text2]
      @wynik = Levenshtein.distance(@tekst,@tekst2)  
    end
  end
end
