# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  submission_id :integer          not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_comments_on_submission_id  (submission_id)
#  index_comments_on_user_id        (user_id)
#
# Foreign Keys
#
#  submission_id  (submission_id => submissions.id)
#  user_id        (user_id => users.id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :submission

  validates_associated :user, :submission
end
