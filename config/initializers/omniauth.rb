Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '251690401578625', 'b6bd9edf6447ba21e081c12bd20f25ae'
end