class AddJobEducationKnowledgeToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :job, :text
    add_column :experiences, :education, :text
    add_column :experiences, :knowledge, :text
  end
end
