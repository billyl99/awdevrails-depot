class GetLineItemPriceFromCart < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    LineItem.find(:all).each do |line_item|
      line_item.update_attribute :price, line_item.product.price if line_item.product.price
    end
  end

  def down
    remove_column :line_items, :price
  end
end
