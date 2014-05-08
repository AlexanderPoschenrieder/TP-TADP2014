require_relative '../../Src/Trait/trait'

class Trait_suma < Trait
  attr_accessor  :metodosConflictivos

  def aplicar_estrategia unaEstrategia
    unaEstrategia.aplicar self
  end
end