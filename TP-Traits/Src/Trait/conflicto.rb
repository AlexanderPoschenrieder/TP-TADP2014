
class Conflicto

  attr_accessor :metodo1,:metodo2,:nombre_metodo

  def initialize nombre,mtd1,mtd2
    self.nombre_metodo=nombre
    self.metodo1=mtd1
    self.metodo2=mtd2
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