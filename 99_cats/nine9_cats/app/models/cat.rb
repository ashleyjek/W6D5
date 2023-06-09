require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(white black gray ginger purple)
    validate :birth_date_cannot_be_future
    validates :name, presence: true
    validates :color, inclusion: { in: CAT_COLORS }, presence: true
    validates :sex, inclusion: { in: %w(F M) }

    def age
        # time_ago_in_words(DateTime.now.year - birth_date.year)
        DateTime.now.year - birth_date.year
    end

    private
    def birth_date_cannot_be_future
        if birth_date > DateTime.now
            errors.add(:birth_date, 'can\'t be in the future')
        end
    end
end