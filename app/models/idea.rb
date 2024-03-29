class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :quality, presence: true, inclusion: { in: %w(genius plausible swill)}
end
