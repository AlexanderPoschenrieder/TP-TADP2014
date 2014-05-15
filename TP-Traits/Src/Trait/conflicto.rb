
class Conflicto

  attr_accessor :bloques_conf,:nombre_metodo

  def initialize nombre
    self.nombre_metodo=nombre
    self.bloques_conf=[]
  end

  def agregar_conf bloque
    self.bloques_conf << bloque
  end

  #def suma_en_orden un_trait
  #  un_trait.metodosTrait.store(self.nombre_metodo,
  #                              lambda{
  #                                self.instance_eval &metodo1
  #                                self.instance_eval &metodo2
  #                              }
  #  )
  #end
end