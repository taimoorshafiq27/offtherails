# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BlogPost < ApplicationRecord
    validates :title, :body, presence: true
end