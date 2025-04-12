# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  validates :content, presence: true

  # Individual callbacks for more control
  after_create_commit -> { broadcast_prepend_to "tasks", partial: "tasks/task", locals: { task: self, fade_in: true } }
  after_update_commit -> { broadcast_replace_to "tasks" }
  after_destroy_commit -> { broadcast_replace_to "tasks", partial: "tasks/task", locals: { task: self, fade_out: true } }
end
