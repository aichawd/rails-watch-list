class Movie < ApplicationRecord
  has_many :bookmarks, before_remove: :check_if_referenced_in_bookmark

  validates :title, :overview, uniqueness: true, presence: true

  def check_if_referenced_in_bookmark
    throw(:abort) if Bookmark.find_by(movie_id: @id)
  end
end
