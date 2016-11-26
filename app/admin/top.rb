ActiveAdmin.register Top do
  permit_params :top1, :desc1, :top2, :desc2, :top3, :desc3, :top4, :desc4, :top5, :desc5, :ispublic, :iscategory, :sources

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
