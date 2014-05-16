require_relative 'conflictos'

class Trait
  attr_accessor :nombre, :metodos, :conflictos
  attr_accessor :nombre_definido

  def initialize
    self.metodos = {}
    self.conflictos = Conflictos.new
  end

  ####-----------------Métodos para la interfaz mas linda------------------------#####
  def nombre unSymbol
    if !nombre_definido
      Object.const_set(unSymbol,self)
      self.nombre_definido=true
    else
      raise("no puede definir mas de una vez el nombre de un Trait")
    end
  end

  def metodo unSymbol, &unBloque
    self.metodos[unSymbol]=unBloque
  end

  def self.define &bloque
    nuevoTrait= Trait.new()
    nuevoTrait.nombre_definido=false
    nuevoTrait.instance_eval &bloque
  end

  ####----------------------------------------------------------------------------#####
  ##Agrega todos los metodos del Trait
  ##
  def agregarMetodos unaClase
    self.metodos.each do |metodo|
      self.agregar_metodo(unaClase,metodo[0],&metodo[1])
    end
  end

  ##Chequea que el metodo no exista
  ## y lo agrega
  def agregar_metodo (unaClase,nombre,&bloque)
    if (!unaClase.instance_methods.include?(nombre))
      unaClase.send :define_method, nombre, bloque
    end
  end

  def tiene_conflictos?
    self.conflictos.existen?
  end

  def tenes_metodo? metodo
    self.metodos.has_key? metodo[0]
  end

  ##Recibe un Trait y retorna una nueva instancia de Trait
  ##Que tiene todos los metodos
  def + unTrait

    traitAux= Trait.new

    traitAux.conflictos.mergear(self.conflictos,unTrait.conflictos)

    metodosUnTrait = unTrait.metodos.clone # se le removeran los conflictivos a continuacion

    self.metodos.each do |metodo|
      if ( unTrait.tenes_metodo? metodo)
        traitAux.conflictos.agregar_metodo(metodo[0],metodo[1])
        traitAux.conflictos.agregar_metodo(metodo[0],metodosUnTrait[metodo[0]])
        metodosUnTrait.delete(metodo[0])
      else
        traitAux.metodos.store(metodo[0],metodo[1])
      end
    end

    metodosUnTrait.each { |metodo|
      if ( traitAux.conflictos.tenes_metodo? metodo[0])
        traitAux.conflictos.agregar_metodo(metodo[0],metodo[1])
      else
        traitAux.metodos.store(metodo[0],metodo[1])
      end
    }

    traitAux
  end

  def - nombreMetodo
    traitAux= Trait.new
    traitAux.metodos= self.metodos.clone
    traitAux.metodos.delete(nombreMetodo)
    traitAux
  end

  def << dos_nombres
    traitAux= Trait.new
    traitAux.metodos = self.metodos.clone
    traitAux.metodos[dos_nombres[1]] = traitAux.metodos[dos_nombres[0]]
    traitAux.metodos.delete(dos_nombres[0]) # <- es realmente necesario borrarlo?
    traitAux
  end

  def aplicar_estrategia unaEstrategia
    unaEstrategia.aplicar self
  end
end
