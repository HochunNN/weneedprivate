class AddProductSubCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_sub_category, :string
  end
end
