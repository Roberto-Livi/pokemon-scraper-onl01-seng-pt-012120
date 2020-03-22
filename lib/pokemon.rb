class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    # sql = "INSERT INTO pokemon(name, type) VALUES (?, ?)"
    # db.execute(sql, name, type)
    
    # Another way to do it
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [name, type])
  end
    
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    pokemon = db.execute(sql, id).flatten
    Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
  end
  
end
