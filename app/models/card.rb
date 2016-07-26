class Double_text < ActiveModel::Validator
  def validate(record)
    if record.original_text.mb_chars.downcase == record.translated_text.mb_chars.downcase 
      record.errors[:base] << "Поля Оригинал и Перевод не могут быть равны"
    end
  end
end

class Card < ApplicationRecord
	validates :original_text, :translated_text, :review_date,  presence: true
	validates :original_text, :translated_text, uniqueness: { case_sensitive: false } 
  validates_with Double_text 
	before_validation do |card_date|
      card_date_create
  end
  
  def card_date_create
      self.review_date = Date.today + 3
  end

  def random_card 
     Card.where('review_date <= ?', Date.today).order('random()').take
  end

  def  chek_card (check_text, translated_text) 
    check_text == translated_text
  end 

  def  re_save_date(id)
   Card.find(id).update(review_date: Date.today + 3) 
  end
end
