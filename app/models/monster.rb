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

  def self.default_scope
    active
  end

  before_save do
    monster_index = MONSTERS.index(name)
    self.number = if monster_index >= 31
                    monster_index + 2
                  else
                    monster_index + 1
                  end
  end

end
