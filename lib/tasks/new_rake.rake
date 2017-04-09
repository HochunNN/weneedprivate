namespace :db do
  namespace :seed do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern    
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end


task :pricecompchange => :environment do
  Product.all.each do |p|
    prod_comp = Productcomp.where(product_website_detail_address: p.product_website_detail_address).take
    if prod_comp.present? 
        # p.product_price =! aaa.product_price
        p.product_price = prod_comp.product_price
        p.save
        
        # puts(p.id)
        # puts(p.product_website)
        # puts(p.product_title)
        # puts(p.product_price)
      
    end
  end
end