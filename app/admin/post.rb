ActiveAdmin.register Post do
  config.per_page = 5
  show do
    attributes_table do
     row  :title
     row  :description
     row  :is_published
    end

    panel 'Comments' do
      table_for post.comments do
        column :body

      end
    end
  end



   permit_params :title,:description,:is_published, comments_attributes: [ :id, :body, :post_id]

   scope :all, default: true
    scope("Active") { |scope| scope.where(is_published: true) }
    scope("Inactive") { |scope| scope.where(is_published: false) }

   index do
     selectable_column
     column :id
     column :title, :sortable => :title
     column :description, :sortable => :description
     column :is_published, :sortable => :is_published
     actions
   end
   form do |f|
     f.inputs 'Post' do
       f.input :title
       f.input :description
       f.input :is_published

     end



     f.inputs do
       f.has_many :comments, new_record: 'Add comments',
         allow_destroy: proc { |comment| comment } do |b|
         b.input :body
       end
     end
     f.actions
   end
end
