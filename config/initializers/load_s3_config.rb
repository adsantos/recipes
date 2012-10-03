# load the libraries
require 'aws'
# Load the access key and secret key for S3 into a hash called S3_CONFIG which can be called from anywhere
S3_CONFIG = YAML.load_file("#{Rails.root}/config/s3_config.yml")
# log requests using the default rails logger
AWS.config(:logger => Rails.logger)
# load credentials from a file
AWS.config(S3_CONFIG)
