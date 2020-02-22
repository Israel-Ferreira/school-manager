class RemoveCourseToStudent < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :course_id
  end
end
