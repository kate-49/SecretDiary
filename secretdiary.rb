require_relative 'readdiary.rb'

class SecretDiary

  def initialize
    @lock = true
    @diary = ReadDiary.new
  end

  def locked?
    @lock = true
  end

  def unlocked?
    @lock = false
  end

  def add_entry(text)
    fail 'Diary is locked' if (@lock == true)
    @diary.add(text)
  end

  def get_entries
    fail 'Diary is locked' if (@lock == true)
    return @diary.read
  end


end
