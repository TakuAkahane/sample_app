class AddSiteUrlToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :site_url, :string, limit: 1026, comment: '会社HPのURL'
  end
end
