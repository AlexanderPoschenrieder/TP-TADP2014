
class Trait
  attr_accessor :nombreTrait
  attr_accessor :metodosTrait

  def agregar_metodo (unaClase,nombre,bloque)
    if (!unaClase.instance_methods.include?(nombre))
      unaClase.send :define_method, nombre, bloque
    end
  end

  def agregarMetodos unaClase
    self.metodosTrait.each do
    |metodoHash|
      self.agregar_metodo(unaClase,metodoHash[0],metodoHash[1])
    end
  end

  #Metodo de clase para definir un nuevo Trait
  #Se le pasa un SYMBOL como nombre y un mapa de (mensaje=>metodo)
  #Crea una constante con ese nombre y mete el Trait
  def self.define(nombre,metodos)
    nuevoTrait=Trait.new()
    nuevoTrait.metodosTrait =(metodos)
    Object.const_set(nombre,nuevoTrait)
  end
end