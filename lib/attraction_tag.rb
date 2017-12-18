class AttractionTag < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :tag
end
