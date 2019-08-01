module ApplicationHelper
  def gravatar_for(user, options = { size: 80}) 
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    default_url = "https://bit.ly/2G197xI"
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
    image_tag(gravatar_url, alt: user.username, width: '128px' )
    end
end
