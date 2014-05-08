require_relative '../../Src/Trait/trait'

class Trait_suma < Trait
  attr_accessor  :metodosConflictivos,:conflictos

  def initialize
    self.conflictos=false
    self.metodosConflictivos=Hash.new()
  end

  def sumar_metodos (metodos_t1,metodos_t2)
    metodos_t2.each{|unElemento|
      if !(metodos_t1.has_key? unElemento[0])
        metodos_t1.store(unElemento[0],unElemento[1])
      else
        self.conflictos=true
        self.metodosConflictivos.store(
            unElemento[0],                               #nombre del mensaje
            [unElemento[1],metodos_t1[unElemento[0]]]    #metodos ordenados
        )
      end
    }
    self.metodosTrait=metodos_t1
  end


  def aplicar_estrategia unaEstrategia
    unaEstrategia.aplicar self
  end
end