require_relative '../convert_table'

describe 'converting a roster from a nested array to a collection of hashes' do
  let (:table) { table_data = [
                                ["first_name", "last_name", "city", "state"],
                                ["Elisabeth", "Gardenar", "Toledo", "OH"],
                                ["Jamaal", "Du", "Sylvania", "OH"],
                                ["Kathlyn", "Lavoie", "Maumee", "OH"]
                                  ] }
  let(:nested_hashes) { convert_table(table) }

  it 'has symbols and keys' do
    expect(nested_hashes[1]["last_name"]).to eq("Du")
  end

end
