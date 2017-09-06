class AddJobApplicationToUserAndOffer < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_applications, :user, foreign_key: true
    add_reference :job_applications, :offer, foreign_key: true
  end
end
