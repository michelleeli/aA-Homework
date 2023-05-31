require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(SELECT * FROM plays WHERE @title = title)
  end 

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL)
    SELECT * FROM plays WHERE @playwright_id = (SELECT id FROM playwright WHERE playwright.name = name)
    SQL
  end 

end

class Playwright 
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    PlayDBConnection.instance.execute(<<-SQL)
    SELECT * FROM playwright WHERE @name = name
    SQL
  end 

  def initialize(options)
    @id = options['id']
    @birth_year = options['birth_year']
    @name = options['name']
  end 

  def create
    raise "#{self} already in database" if options['id']
    PlayDBConnection.instance.execute(<<-SQL, self.birth_year, self.name)
      INSERT INTO
        playwrights(birth_year, name)
      VALUES 
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end 

  def update
    raise "#{self} not in database unless options['id']"
    PlayDBConnection.instance.execute (<<-SQL, self.birth_year, self.name)
    UPDATE
      playwrights
    SET
      birth_year = ?, name = ?
    WHERE 
      id = ?
    SQL
  end 

  def get_plays
    PlayDBConnection.instance.execute(SELECT * FROM plays WHERE playwright_id = self.id)
  end 

end 