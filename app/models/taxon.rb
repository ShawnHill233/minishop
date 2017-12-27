class Taxon < ApplicationRecord
  belongs_to :parent
  belongs_to :taxonomy
end
