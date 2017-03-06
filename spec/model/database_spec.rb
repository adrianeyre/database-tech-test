describe VariableDatabase do
  subject(:variable_database) {described_class.new}
  let(:key)   {"somekey"}
  let(:value) {"somevalue"}
  let(:data)  {{key=>value}}

  context "Database has been initialized" do
    it "the Database initialize with a blank hash" do
      expect(variable_database).to have_attributes(:data => {})
    end

    describe '#add' do
      it 'adds data to the database' do
        variable_database.add(data)
        expect(variable_database.data[key]).to eq value
      end

      it 'updates an existing variable in the database' do
        variable_database.add({key=>"123"})
        variable_database.add(data)
        expect(variable_database.data[key]).to eq value
      end
    end

    describe '#get' do
      it 'gets data from the database' do
        variable_database.add(data)
        expect(variable_database.get(key)).to eq(data)
      end

      it 'gets empty hash if key does not exist in the database' do
        expect(variable_database.get(key)).to eq({})
      end
    end

  end
end
