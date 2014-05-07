require 'rspec'

class Trait
  attr_accessor :nombreTrait, :metodosTrait, :estrategia, :metodosConflictivos

  ##Chequea que el metodo no exista
  ## y lo agrega
  def agregar_metodo (unaClase,nombre,bloque)
    if (!unaClase.instance_methods.include?(nombre))
      unaClase.send :define_method, nombre, bloque
    end
  end

  ##Agrega todos los metodos del Trait
  ##
  def agregarMetodos unaClase
    self.metodosTrait.each do |metodoHash|
      self.agregar_metodo(unaClase,metodoHash[0],metodoHash[1])
    end
  end

  #Metodo de clase para definir un nuevo Trait
  #Se le pasa un SYMBOL como nombre y un mapa de (mensaje=>metodo)
  #Crea una constante con ese nombre y mete el Trait
  def self.define(nombre,metodos)
    nuevoTrait=Trait.new
    nuevoTrait.metodosTrait= (metodos)
    Object.const_set(nombre,nuevoTrait)
  end


  ##Recibe un Trait y retorna una nueva instancia de Trait
  ##Que tiene todos los metodos
  def + unTrait
    traitAux= Trait.new
    metodosT1= self.metodosTrait.clone
    metodosT2= unTrait.metodosTrait.clone
    metodosT2.each{|unElemento|
      if !(metodosT1.has_key? unElemento[0])
        metodosT1.store(unElemento[0],unElemento[1])
        metodosT2.delete(unElemento[0])
      end
    }
    traitAux.metodosTrait= metodosT1
    traitAux.metodosConflictivos= metodosT2
    traitAux
  end

  def - unMetodo
    traitAux= Trait.new
    traitAux.metodosTrait= self.metodosTrait.clone
    traitAux.metodosTrait.delete(unMetodo)
    traitAux
  end

  def << dos_nombres
    traitAux= Trait.new
    traitAux.metodosTrait= self.metodosTrait.clone
    traitAux.metodosTrait[dos_nombres[1]]=traitAux.metodosTrait[dos_nombres[0]]
    traitAux.metodosTrait.delete(dos_nombres[0])
    traitAux
  end
end
