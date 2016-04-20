module InlineSvg::TransformPipeline::Transformations
  class Title < Transformation
    def transform(doc)
      doc = Nokogiri::XML::Document.parse(doc.to_html)
      node = Nokogiri::XML::Node.new('title', doc)
      node.content = value
      doc.search('svg title').each { |node| node.remove }
      doc.at_css('svg').children.before(node)
      doc
    end
  end
end
