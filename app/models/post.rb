class Post < ApplicationRecord
    # validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validate :custom_title_validations
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    def custom_title_validations
        # unless title.include?("Won't Believe")
        unless title
            errors.add(:title, "can't be blank")
        end

        unless title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
            errors.add(:title, "Not click-baity enough")
        end
    end
end
