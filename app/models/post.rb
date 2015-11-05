class Post < ActiveRecord::Base
  class User < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
  end
end
