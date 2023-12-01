class Todo < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
  
    validates :title, presence: true
  
    # Create the Elasticsearch index
    index_name "todos-#{Rails.env}"
  
    after_commit on: [:create] do
      __elasticsearch__.index_document
    end
  
    after_commit on: [:update] do
      __elasticsearch__.update_document
    end
  
    after_commit on: [:destroy] do
      __elasticsearch__.delete_document
    end
  end