module SirTrevorable
  extend ActiveSupport::Concern
  included do
    def to_sir_trevor
      {data: self.blocks.collect { |block| block.specific.as_json } }.to_json
    end
  end

  module ClassMethods
    # Creates the Articles blocks using sir trevor
    #
    # @todo Document method
    # @todo complete image handling
    def create_from_sir_trevor sir_trevor_content
      json = JSON.parse(sir_trevor_content)
      meta = json['meta']

      data = json['data']
      # If there are no blocks provided, we have to throw an error
      return if data.empty? || meta['title'].blank?

      #Otherwise, create the block
      article = Article.create(title: meta['title'])
      data.each do |block|
        case block['type'].to_sym
        when :text
          article.create_text_block(body: block['data']['text'])
        when :image
          uploaded_image = Image.find(block['data']['id'])
          article.create_image_block(image: uploaded_image)
        when :video
          article.create_link_block(source: block['data']['source'], video_id: block['data']['remote_id'])
        when :equation
           equation_block = article.create_equation_block(equation: block['data']['equation'], label: block['data']['label'])
		   
		   #add any variables associated with this equation
		   variables = block['data']['variables']
		   if variables != nil
				variables.keys.each do |key|
				variable = EquationBlockVariable.new(variable: variables[key]["variable"],description: variables[key]["description"])
				variable.article_equation_block_id = equation_block.id
				variable.save!
			end
		end
		   
      when :diagram
          article.create_diagram_block(code: block['data']['code'], caption: block['data']['caption'])
        end
      end

      meta['subcategories'].each do |subcategory_id|
        article.categorizations.create(subcategory_id: subcategory_id)
      end

      article
    end
  end
end