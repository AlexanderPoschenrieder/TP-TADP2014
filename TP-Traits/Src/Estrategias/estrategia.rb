class Estrategia
  def  aplicar(un_trait)
    un_trait.conflictos.hashConflictos.each{ |nombreMetodo, arrayBloques|
      self.checkear_aridad nombreMetodo, arrayBloques
      un_trait.metodos.store( nombreMetodo, armar_metodo(arrayBloques))
      un_trait.conflictos.remover(nombreMetodo)
    }
    un_trait
  end

  def checkear_aridad nombreMetodo, arrayBloques
    aridad = arrayBloques[0].arity
    arrayBloques.each{ |bloque|
       if ( bloque.arity != aridad )
         raise("Existen dos métodos con el nombre:"+ nombreMetodo.to_s+ " y con diferente aridad")
       end
    }
  end
end