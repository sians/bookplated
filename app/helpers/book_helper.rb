module BookHelper
  def photo_or_placeholder(book)
    if book.photo_url.present?
      cl_image_path book.photo_url
    else
      'http://via.placeholder.com/140x200'
      # 'https://res.cloudinary.com/djkvtunck/image/upload/v1568216783/j54mfn75mceuggabjkkt.png'
    end
  end
end
