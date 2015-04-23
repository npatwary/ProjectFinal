# == Schema Information
#
# Table name: invited_games_models
#
#  id            :integer          not null, primary key
#  name          :string
#  dungeonMaster :string
#  passKey       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


require 'test_helper'

class InvitedGamesModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
