class AddDefaultSchool < ActiveRecord::Migration[7.2]
  def change
    School.create(name: 'Default School', localization: 'Default Location', description: 'This is the default school.') unless School.exists?(name: 'Default School')
  end
end
