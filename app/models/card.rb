class Text_valid < ActiveModel::Validator
  def validate(record)
    if record.original_text.mb_chars.downcase == record.translated_text.mb_chars.downcase 
      record.errors[:base] << "Поля Оригинал и Перевод не могут быть равны"
    end
  end
end

class Card < ApplicationRecord
	validates :original_text, :translated_text, :review_date,  presence: true
	validates :original_text, :translated_text, uniqueness: { case_sensitive: false } 
    validates_with Text_valid
	before_validation do |card_date|
       self.review_date = Date.today + 3
    end
end
