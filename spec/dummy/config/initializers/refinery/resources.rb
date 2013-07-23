# encoding: utf-8
Refinery::Resources.configure do |config|
  # Configures the maximum allowed upload size (in bytes) for a file upload
  # config.max_file_size = 52428800

  # Configure how many resources per page should be displayed when a dialog is presented that contains resources
  # config.pages_per_dialog = 12

  # Configure how many resources per page should be displayed in the list of resources in the admin area
  # config.pages_per_admin_index = 20

  # Configure S3 (you can also use ENV for this)
  # The s3_backend setting by default defers to the core setting for this but can be set just for resources.
  # config.s3_backend = Refinery::Core.s3_backend
  # config.s3_bucket_name = ENV['S3_BUCKET']
  # config.s3_access_key_id = ENV['S3_KEY']
  # config.s3_secret_access_key = ENV['S3_SECRET']
  # config.s3_region = ENV['S3_REGION]

  # Configure Dragonfly
  # This is where in the middleware stack to insert the Dragonfly middleware
  # config.dragonfly_insert_before = "ActionDispatch::Callbacks"
  # config.dragonfly_secret = "bd63c8621a09b4f4212cb94d418784bb8301c08736468e09"
  # config.dragonfly_url_format = "/system/resources/:job/:basename.:format"
  # config.datastore_root_path = "/Users/j_f_alameda/refinery-engine-test/vendor/extensions/refinerycms-dynamicfields/spec/dummy/public/system/refinery/resources"

end
