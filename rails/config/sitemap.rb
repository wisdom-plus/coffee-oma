# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://coffee-oma.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  Product.all.each do |product|
    add product_path(product), :lastmod => product.updated_at
  end
  Bean.all.each do |bean|
    add bean_path(bean), :lastmod => bean.updated_at
  end
  add prodcuts_path, changefreq: 'daily', priority: 0.9
  add beans_path, changefreq: 'daily', priority: 0.8
end
