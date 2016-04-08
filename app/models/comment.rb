class Comment < ActiveRecord::Base
    # validates :commenter, presence: true, length: {minimum: 1}
    # validates :body, presensce: true, length: {minimum: 1}
    belongs_to :article
end
