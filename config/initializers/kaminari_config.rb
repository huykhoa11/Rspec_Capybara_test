# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 4
  # config.max_per_page = nil
  config.window = 3
  config.outer_window = 1
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :pageMethod
  # config.param_name = :pageParams
  # config.max_pages = nil
  # config.params_on_first_page = false
end
