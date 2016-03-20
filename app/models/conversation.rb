class Conversation < ActiveRecord::Base
  # Tracking for Notifications (defaults to create, update, destroy)
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  # ActiveRecord Relationships
  belongs_to :request
  belongs_to :user, :foreign_key => :sender_id
  belongs_to :user, :foreign_key => :recipient_id
  has_many :messages, dependent: :destroy

  # ActiveRecord Validations
  validates :request_id, presence: true
  validates_uniqueness_of :sender_id, :scope => :recipient_id
  validates :request_id, presence: true

  # Scope (prevents duplicate conversations between sender and recipient)
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
end
