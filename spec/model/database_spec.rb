describe VariableDatabase do
  subject(:variable_database) {described_class.new}
  let(:key)   {"somekey"}
  let(:value) {"somevalue"}
  let(:data)  {{key=>value}}

  context "Database has been initialized" do
    it "The Database initialize with a blank hash" do
      expect(variable_database).to have_attributes(:data => {})
    end

    describe '#add' do
      it 'adds data to the database' do
        variable_database.add(data)
        expect(variable_database.data[key]).to eq value
      end
    end

    describe '#get' do
      it 'gets data to the database' do
        variable_database.add(data)
        expect(variable_database.get(key)).to eq(data)
      end

      it 'gets empty hash if key does not exist' do
        expect(variable_database.get(key)).to eq({})
      end
    end

  end
end
