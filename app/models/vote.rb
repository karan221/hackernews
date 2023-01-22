# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_votes_on_item_id              (item_id)
#  index_votes_on_user_id              (user_id)
#  index_votes_on_user_id_and_item_id  (user_id,item_id) UNIQUE
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
