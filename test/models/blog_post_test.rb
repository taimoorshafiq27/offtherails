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
require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "blog post is valid" do
    blog_post = BlogPost.new(email: "email@hotmal.co.uk", body: "body")
    blog_post.save
    assert true
  end
end
