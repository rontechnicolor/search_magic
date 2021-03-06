class Game
  include Mongoid::Document
  include SearchMagic::FullTextSearch
  field :title, :type => String
  field :price, :type => Float
  field :high_score, :type => Integer
  field :released_on, :type => Date
  references_and_referenced_in_many :players
  referenced_in :developer
  
  search_on :title
  search_on :price, :keep_punctuation => true
  search_on :high_score
  search_on :released_on, :keep_punctuation => true
  search_on :developer, :except => :opened_on
  search_on :players
end