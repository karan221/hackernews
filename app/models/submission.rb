# frozen_string_literal: true

# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  body       :text             default(""), not null
#  title      :string           default(""), not null
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_submissions_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#

class Submission < ApplicationRecord
  URL_REGEX = %r{https?://(www.)?[-a-zA-Z0-9@:%._+~#=]{1,256}.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_+.~#?&/=]*)}
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :url, presence: true, format: { with: URL_REGEX, message: "must be a valid URL" }
  validates :body, length: { maximum: 1000 }

  def site
    url.match(%r{^https?://(www.)?([^/]+)/})[2]
  end

  def rank
    id
  end
end
