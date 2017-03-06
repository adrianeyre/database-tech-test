describe VariableDatabase do
  subject(:variable_database) {described_class.new}

  context "Database has been initialized" do
    it "The Database initialize with a blank hash" do
      expect(variable_database).to have_attributes(:data => {})
    end

    describe '#add' do
      it 'adds data to the database' do
        variable_database.add({"somekey"=>"somevalue"})
        expect(variable_database.data["somekey"]).to eq "somevalue"
      end
    end

    describe '#get' do
      it 'gets data to the database' do
        variable_database.add({"somekey"=>"somevalue"})
        expect(variable_database.get("somekey")).to eq({"somekey"=>"somevalue"})
      end
    end
  end
end
