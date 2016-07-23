class Monster < ActiveRecord::Base
  MONSTERS = %w(
    Bulbasaur
    Ivysaur
    Venusaur
    Charmander
    Charmeleon
    Charizard
    Squirtle
    Wartortle
    Blastoise
    Caterpie
    Metapod
    Butterfree
    Weedle
    Kakuna
    Beedrill
    Pidgey
    Pidgeotto
    Pidgeot
    Rattata
    Raticate
    Spearow
    Fearow
    Ekans
    Arbok
    Pikachu
    Raichu
    Sandshrew
    Sandslash
    Nidoran
    Nidorina
    Nidoqueen
    Nidorino
    Nidoking
    Clefairy
    Clefable
    Vulpix
    Ninetales
    Jigglypuff
    Wigglytuff
    Zubat
    Golbat
    Oddish
    Gloom
    Vileplume
    Paras
    Parasect
    Venonat
    Venomoth
    Diglett
    Dugtrio
    Meowth
    Persian
    Psyduck
    Golduck
    Mankey
    Primeape
    Growlithe
    Arcanine
    Poliwag
    Poliwhirl
    Poliwrath
    Abra
    Kadabra
    Alakazam
    Machop
    Machoke
    Machamp
    Bellsprout
    Weepinbell
    Victreebel
    Tentacool
    Tentacruel
    Geodude
    Graveler
    Golem
    Ponyta
    Rapidash
    Slowpoke
    Slowbro
    Magnemite
    Magneton
    Farfetch'd
    Doduo
    Dodrio
    Seel
    Dewgong
    Grimer
    Muk
    Shellder
    Cloyster
    Gastly
    Haunter
    Gengar
    Onix
    Drowzee
    Hypno
    Krabby
    Kingler
    Voltorb
    Electrode
    Exeggcute
    Exeggutor
    Cubone
    Marowak
    Hitmonlee
    Hitmonchan
    Lickitung
    Koffing
    Weezing
    Rhyhorn
    Rhydon
    Chansey
    Tangela
    Kangaskhan
    Horsea
    Seadra
    Goldeen
    Seaking
    Staryu
    Starmie
    Mr.Mime
    Scyther
    Jynx
    Electabuzz
    Magmar
    Pinsir
    Tauros
    Magikarp
    Gyarados
    Lapras
    Ditto
    Eevee
    Vaporeon
    Jolteon
    Flareon
    Porygon
    Omanyte
    Omastar
    Kabuto
    Kabutops
    Aerodactyl
    Snorlax
    Articuno
    Zapdos
    Moltres
    Dratini
    Dragonair
    Dragonite
    Mewtwo
    Mew
  )

  MISSING = %w(
    Mewtwo
    Mew
    Articuno
    Zapdos
    Moltres
  )

  DONT_INCLUDE = %w(
    Doduo
    Pinsir
    Rattata
    Pidgey
    Zubat
    Spearow
    Weedle
  )

  VOTE_THRESHOLD = 5

  has_many :activities

  validates :name, :lat, :lng, presence: true
  validates_inclusion_of :name, :in => MONSTERS - MISSING, :allow_nil => false
  geocoded_by :address, :latitude  => :lat, :longitude => :lng

  scope :recent, -> (condition) { where(created_at: 1.hours.ago..Time.now) if condition}
  scope :highly_rated, -> (condition) { where("total_vote_count > ?", VOTE_THRESHOLD) if condition}
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :with_associations, -> { includes(:activities, activities: [:user]) }
  scope :not_expired, -> { where("expires_at > ? OR expires_at IS NULL", Time.now) }
  scope :no_common, -> { where.not(name: DONT_INCLUDE) }

  def self.default_scope
    active
  end

  def self.get_real_monsters(lat, lng)
    delay.request_monsters(lat, lng)
  end

  def self.request_monsters(lat, lng)
    p "request monsters"
  #  if Monster.near([lat, lng], 0.07).where('expires_at < ?', Time.now - 10.minutes).first.nil?
      url = ""
      response = Faraday.get do |req|
        url = "https://real-monsters.herokuapp.com/" + "?longitude=" + lng.to_s + "&latitude=" + lat.to_s
        req.url url
      end
      p url
      monsters = nil
      begin
        monsters = JSON.parse(response.body)
      rescue
        p "No server response"
      end
      if monsters
        monsters["pokemons"].each do |key, monster|
          near_monster = Monster.near([monster["lat"], monster["lng"]], 0.01).where(name: monster["monster_name"]).first
          if !near_monster || near_monster.expires_at < Time.now
            m = Monster.new
            m.name = get_name_from_pokemon_number(monster["pokemon_data"]["pokemon_id"])
            m.lat = monster["latitude"]
            m.lng = monster["longitude"]
            m.number = monster["pokemon_data"]["pokemon_id"]
            m.expires_at = Time.at(monster["hides_at"])
            m.payload = monster
            m.save
          end
        end
      end
    #end
  end

  before_save do
    monster_index = MONSTERS.index(name)
    self.number = get_actual_number(monster_index)
  end

  # bc nidoran and i am lazy
  def get_actual_number(number)
    if number >= 31
      return number + 2
    else
      return number + 1
    end
  end

  def self.get_name_from_pokemon_number(pokemon_number)
    if pokemon_number < 31
      return MONSTERS[pokemon_number - 1]
    else
      if pokemon_number == 32
        return "Nidoran"
      elsif pokemon_number == 31
        return "Nidoqueen"
      else
        return MONSTERS[pokemon_number - 2]
      end
    end
  end

end
