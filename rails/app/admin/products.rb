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
    permitted = %i[itemname itemprice shopname catchcopy imageurl itemurl itemcaption tag_list]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
  end

  form do |f|
    f.inputs 'Details', multipart: true do
      f.input :itemname
      f.input :itemprice
      f.input :shopname
      f.input :catchcopy
      f.input :imageurl
      f.input :itemurl
      f.input :itemcaption
      f.input :tag_list
    end
    f.actions
  end
end
