class Class
  def uses(unTrait)
    # Aca se verifica si el trait tiene metodos conflictivos y se resuelve de acuerdo a la estrategia
    unTrait.agregarMetodos(self)
  end
end