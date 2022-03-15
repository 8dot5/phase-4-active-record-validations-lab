class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] } 
    validates :title, exclusion: { in: [ "True Facts" ] }

    validate :clickbaity?

    def clickbaity?
        if title.to_s.include?("Won't Believe")
            true
        elsif title.to_s.include?("Secret")
            true
        elsif title.to_s.include?("Top #{0..9}")
            true
        elsif title.to_s.include?("Guess")
            true
        elsif title.to_s.include?("You Won't Believe These True Facts")
            false
        else
            errors.add(:title, "is not clickbait-y")
        end
    end

end
