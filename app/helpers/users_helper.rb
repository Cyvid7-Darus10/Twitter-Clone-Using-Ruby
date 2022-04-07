module UsersHelper
    def profile_image(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar rounded-circle w-100")
    end
end
