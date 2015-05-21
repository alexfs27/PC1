# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ActiveRecord::Base
    has_many :pots, dependent: :destroy
    validates :title, presence:true
end
