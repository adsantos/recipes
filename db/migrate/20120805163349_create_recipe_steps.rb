class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_id
      t.integer :step_id

      t.timestamps
    end
  end
end
