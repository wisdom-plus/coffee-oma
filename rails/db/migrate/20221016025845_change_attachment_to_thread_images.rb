class ChangeAttachmentToThreadImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :thread_images, :attachment, :string

    add_column :thread_images, :attachments, :json
  end
end
