# A diagram has many {ArticleDiagramBlock}. This is so a diagram can be reused in
# many articles.
# @see ArticleDiagramBlock
#
# == Schema Information
#
# Table name: diagrams
#
#  body             :text(65535)          primary key
#   - represents the diagram
#
#  label            :string(255)
#   - represents the label for the diagram
#
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Diagram < ActiveRecord::Base
  has_many :article_diagram_blocks

  validates :body, presence: true, length: {maximum: 65535}
  validates :label, presence: true, length: {maximum: 255}
end
