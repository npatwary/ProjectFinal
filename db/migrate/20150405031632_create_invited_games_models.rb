class CreateInvitedGamesModels < ActiveRecord::Migration
  def change
    create_table :invited_games_models do |t|
      t.string :name
      t.string :dungeonMaster
      t.string :passKey

      t.timestamps null: false
    end
  end
end
