ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :itemname, :catchcopy, :itemprice, :itemcaption, :itemurl, :imageurl, :shopname, :tag_list
  #
  # or
  #
  permit_params do
    permitted = [:itemname, :itemprice, :shopname, :catchcopy, :imageurl, :itemurl, :itemcaption, :tag_list]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
