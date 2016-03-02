class RemoveDescriptionExperienceTypeFromExperiences < ActiveRecord::Migration
  def change
    remove_column :experiences, :description, :text
    remove_column :experiences, :experience_type, :string
  end
end
