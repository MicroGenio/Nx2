module ApplicationHelper

    def gravatar_for(marketer, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(marketer.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: marketer.marketername, class: "gravatar")
    end    
end
