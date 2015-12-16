require_relative 'factories'
require_relative 'contact'
require_relative 'group'

describe Contact do
  before(:each) do
    $db.transaction
  end

  after(:each) do
    $db.rollback
  end

  describe "#save" do
    describe "on a new record" do
      let(:contact) { Contact.new }

      it "sets id after saving" do
        expect(contact.id).to be_nil
        contact.save
        expect(contact.id).not_to be_nil
      end
    end

    describe "on an existing record" do
      let(:contact) do
        Contact.find(create_contact(company: 'Initech'))
      end

      it "updates the other columns" do
        expect(contact.company).to eq('Initech')
        contact.company = 'Intertrode'
        contact.save
        expect(contact.company).to eq('Intertrode')
      end
    end
  end

  describe ".find" do
    let(:id) { create_contact(first_name: 'Nobody') }

    it "finds record by ID" do
      contact = Contact.find(id)
      expect(contact).to_not be_nil
      expect(contact.id).to eq(id)
    end

    it "returns nil if the record is not found" do
      contact = Contact.find(-100)
      expect(contact).to be_nil
    end
  end

  describe "#destroy" do
    let(:contact) { Contact.find(create_contact(first_name: 'Bob')) }

    it "removes the record" do
      contact.destroy
      expect(Contact.find(contact.id)).to be_nil
    end
  end

  describe ".all" do
    let!(:alice_id) { create_contact(first_name: 'Alice') }
    let!(:bob_id) { create_contact(first_name: 'Bob') }
    let(:contacts) { Contact.all }

    it "returns an array of contacts" do
      expect(contacts).to be_an(Array)
      expect(contacts.first).to be_a(Contact)
    end

    it "returns all contacts" do
      ids = contacts.map(&:id)
      expect(ids).to include(alice_id)
      expect(ids).to include(bob_id)
    end
  end

  describe ".where" do
    let!(:alice_id) { create_contact(first_name: 'Alice') }
    let!(:bob_id) { create_contact(first_name: 'Bob') }
    let(:contacts) { Contact.where("first_name = 'Alice'") }

    it "returns an array of contacts" do
      expect(contacts).to be_an(Array)
      expect(contacts.first).to be_a(Contact)
    end

    it "includes only matching records" do
      ids = contacts.map(&:id)
      expect(ids).to include(alice_id)
      expect(ids).not_to include(bob_id)
    end
  end
end
