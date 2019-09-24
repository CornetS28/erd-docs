Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '386518075354077', 'd2bf964c6801ae083fe9e22de84a898c'
end