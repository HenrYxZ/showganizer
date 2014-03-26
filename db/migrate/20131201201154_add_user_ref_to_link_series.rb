class AddUserRefToLinkSeries < ActiveRecord::Migration
  def change
    add_reference :link_series, :user, index: true
  end
end
