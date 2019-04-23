require 'csv'

class BaseRepository
  def initialize(csv_file)
    @elements = []
    @csv_file = csv_file
    load_csv if File.exist?(@csv_file)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << csv_headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end
end
