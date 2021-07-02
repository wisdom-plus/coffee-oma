class AddIndexToNotification < ActiveRecord::Migration[6.1]
  def change
    add_index(:notifications,:created_at)
    add_index(:notifications,:checked)
    add_index(:likes,:created_at)
    add_index(:products,:likes_count)
    add_index(:beans,:likes_count)
    add_index(:reviews,:created_at)
    add_index(:bean_reviews,:created_at)
  end
end
