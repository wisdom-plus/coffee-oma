module ApplicationHelper
  def default_meta_tags
    {
      site: 'coffee-oma',
      title: 'coffee-oma',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: 'coffee-omaはコーヒーに関するアイテムや豆を、レビューし評価するwebサイトです。',
      keywords:'coffee,coffee-bean,review',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        {herf: image_tag('/favicon.icon')}
      ],
      og: {
        site_name: 'coffee-oma',
        title: 'coffee-oma',
        description: 'coffee-omaはコーヒーに関するアイテムや豆を、レビューし評価するwebサイトです。',
        type: 'website',
        url: request.original_url,
        locale: 'ja_JP'
      }
    }
  end
end
