require './secretdiary.rb'

describe SecretDiary do

  it { is_expected.to respond_to(:locked?) }
  it { is_expected.to respond_to(:unlocked?) }
  it { is_expected.to respond_to(:add_entry) }
  it { is_expected.to respond_to(:get_entries) }

  describe '#lock' do
    it 'will defaults to locked when initialized' do
      expect(subject.locked?).to eq(true)
    end

    it 'will lock' do
      expect(subject.locked?).to eq(true)
    end
  end

  describe '#unlock' do
    it 'can change status to unlocked' do
      expect(subject.unlocked?).to eq(false)
    end

    it 'will unlock' do
      expect(subject.unlocked?).to eq(false)
    end
  end

  describe '#add' do
    it 'will raise an error if locked and add entry' do
      expect { subject.add_entry('message')}.to raise_error('Diary is locked')
    end

    it 'will allow an entry to be added if unlocked' do
      subject.unlocked?
      subject.add_entry('text')
      expect(subject.get_entries).to eq(['text'])
    end

    it 'will throw errors if unlocked then locked again and try to add' do
      subject.unlocked?
      subject.add_entry('message1')
      subject.locked?
      expect{ subject.add_entry('message2')}.to raise_error('Diary is locked')
    end
  end

  describe '#get_entries' do
    it 'will raise an error if locked and try to get entries' do
      expect { subject.get_entries}.to raise_error('Diary is locked')
    end

    it 'will allow diary to be read if unlocked' do
      subject.unlocked?
      subject.add_entry('generic message')
      expect(subject.get_entries).to eq(['generic message'])
    end

    it 'will throw errors if unlocked then locked again and try to read' do
      subject.unlocked?
      subject.add_entry('message1')
      subject.locked?
      expect{ subject.get_entries}.to raise_error('Diary is locked')
    end
  end

end
