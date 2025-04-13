# == Schema Information
#
# Table name: zebras
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Zebra < ApplicationRecord
  # broadcasts_refreshes

  # Individual callbacks for more control
  after_create_commit -> { broadcast_refresh_to "zebras" }
  after_update_commit -> { broadcast_refresh_to "zebras" }
  after_destroy_commit -> { broadcast_refresh_to "zebras" }
  
  validates :name, presence: true
end
