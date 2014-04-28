class Class
  def agregar_metodo (nombre,bloque)
    if (!self.instance_methods.include?(nombre))
        self.send :define_method, nombre, bloque
    end

  end

  def uses (unTrait)
    unTrait.metodosTrait.each do
      |metodoHash|
      self.agregar_metodo(metodoHash[0],metodoHash[1])
    end
  end


end



class Trait
  attr_accessor :nombreTrait
  attr_accessor :metodosTrait


  #self define(nombre, metodos)
  #  nombre=TraitConcreto.new()
  #end
end

#class TraitConcreto
#  attr_accessor :metodoConcreto
#
#end

class TraitLoco< Trait
  def initialize
    bloques={
        :holiss_mundo=>lambda{puts 'holiss mundis'},
        :holaAle =>lambda{puts 'que haces ale wachiturro'}}

    @nombreTrait = :elTraitLoco
    @metodosTrait =bloques
  end
end



traitNuevo= Trait.new()


class Holamundo
  uses TraitLoco.new()
  def holiss_mundo
    puts 'concha tu madre'
  end

end
holiss= Holamundo.new
holiss.holiss_mundo
holiss.holaAle

