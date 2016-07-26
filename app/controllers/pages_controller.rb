class PagesController < ApplicationController
  def home
  	random_card = Card.new
  	@random = random_card.random_card
  	end
  def  perform
  	checking = Card.new 
  	@check_text = params[:check_text]
  	@translated_text = params[:translated_text]
  	if checking.chek_card(@check_text, @translated_text)
    	checking.re_save_date(params[:id])
      flash[:message] = "Проверка успешно пройдена"
    	redirect_to :home
    else
      	flash[:error] = "В следующий раз ..."
      	puts "Could not save client"
      	redirect_to :home
    end 
  end
end
 