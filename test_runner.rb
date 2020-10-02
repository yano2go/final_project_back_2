require 'aws-sdk-s3'  # v2: require 'aws-sdk'
#Aws.config.update [:credentials] Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
      
s3 = Aws::S3::Resource.new(region: 'us-east-2')
puts s3

file = 'C:\file.txt'
another_file = './gifs_backend_app_api/test.gif'
bucket = 'learningingifs'
      
# Get just the file name
name = File.basename(another_file)

# Create the object to upload
obj = s3.bucket(bucket).object(name)

# Upload it      
obj.upload_file(file)