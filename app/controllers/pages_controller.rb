class PagesController < ApplicationController
  def home
  	@random = Card.random_card
  end

  def  perform
  	card =  Card.find(params[:id]) 
  	if 
      card.chek_card(params[:check_text])
    	card.increase_review_date(params[:id])
      flash[:message] = "Проверка успешно пройдена"
    	redirect_to :home
    else
      flash[:error] = "В следующий раз ..." 
      redirect_to :home
    end 
  end
end
 