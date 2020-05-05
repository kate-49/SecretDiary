class ReadDiary
  def initialize
    @diary_entries = []
  end

  def read
    @diary_entries
  end

  def add(text)
    @diary_entries << text
  end
end
