PDFKit.configure do |config|       
  #config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if Rails.env.production?  

  config.default_options = {
    :page_size     => 'Letter',
		:print_media_type => true,
    :margin_top    => '0.25in',
    :margin_right  => '0.25in',
    :margin_bottom => '0.25in',
    :margin_left   => '0.25in'
  }
end
