require 'prawn'
require 'gruff'

module GeneratePdf
  PDF_OPTIONS = {
    page_size: 'A4',
    page_layout: :portrait,
    margin: [40, 75]
  }.freeze

  def self.agreement(_name, _details, _price)
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      pdf.font 'Helvetica'
      pdf.fill_color '666666'

      pdf.text 'Diana Regina', size: 32, style: :bold, align: :center
    end
  end
end
