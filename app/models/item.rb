# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  ancestry   :string
#  body       :text             default(""), not null
#  kind       :integer          default("story"), not null
#  title      :string           default(""), not null
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_items_on_ancestry  (ancestry)
#  index_items_on_user_id   (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Item < ApplicationRecord
  has_ancestry

  URL_REGEX = %r{https?://(www.)?[-a-zA-Z0-9@:%._+~#=]{1,256}.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_+.~#?&/=]*)}

  enum kind: { story: 0, comment: 1 }

  belongs_to :user

  has_many :votes, as: :voteable, dependent: :destroy

  validates :title, length: { maximum: 100 }
  # validates :url, format: { with: URL_REGEX, message: "must be a valid URL" }
  validates :body, length: { maximum: 1000 }

  def site
    url.match(%r{^https?://(www.)?([^/]+)/?})[2]
  end

  def rank
    id
  end
end
