class Class
  def uses(unTrait)
    if unTrait.conflictos
      raise("Hay conflictos no resueltos en el Trait")
    else
      # Aca se verifica si el trait tiene metodos conflictivos y se resuelve de acuerdo a la estrategia
      unTrait.agregarMetodos(self)
    end
  end
end