task :expire_requests => :environment do
  Request.expire_requests
end
