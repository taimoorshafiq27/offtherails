# == Schema Information
#
# Table name: blog_posts
#
#  id           :bigint           not null, primary key
#  body         :text
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class BlogPost < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    # instead of fetching all blog posts when we do BlogPost.all, we want to define scopes to categorize posts with different statuses:
    scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
    scope :draft, -> { where(published_at: nil) }
    scope :published, -> { where("published_at <= ?", Time.current) }
    scope :scheduled, -> { where("published_at >= ?", Time.current) }
    # the lamda allows the app to evaluate Time.current every time the app asks for e.g. published_at scope posts, instead of there only being one Time.current which would be the Time.current when the app is booted up.

    def draft?
        published_at.nil?
    end

    def published?
        published_at? && published_at <= Time.current
    end

    def schedule?
        published_at? && published_at > Time.current
    end
end

# add more validations
# start adding tests
