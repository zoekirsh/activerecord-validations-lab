class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbait 

  def clickbait
    if self.title
      if !["Won't Believe", "Secret", "Top 3", "Guess"].any? {|str| self.title.include? str}
      errors.add(:title, "Title is not clickbait!")
      end
    end
  end
end
