class Conflictos

  attr_accessor :hashConflictos

  def initialize
    self.hashConflictos = {}
  end

  def agregar_metodo(nombre, bloque)
    if ( !self.hashConflictos.has_key? nombre )
      self.hashConflictos.store(nombre,[])
    end
    self.hashConflictos[nombre] << bloque
  end

  def tenes_metodo? nombreMetodo
    self.hashConflictos.has_key? nombreMetodo
  end

  def existen?
    self.hashConflictos.keys.any?
  end

  def mergear(*otrosConflictos)
    otrosConflictos.each{|unConflicto|
      unConflicto.hashConflictos.each { |nombre, arrayBloques|
        arrayBloques.each{|bloque|
          self.agregar_metodo(nombre,bloque)
        }
      }
    }
  end

  def remover(nombreMetodo)
    if ( self.hashConflictos.has_key? nombreMetodo )
      self.hashConflictos.delete(nombreMetodo)
    end
  end

end