require 'rspec'
require '../../TP-Traits/Src/trait.rb'
require '../../TP-Traits/Src/clase.rb'
class Trait
  attr_accessor :nombreTrait
  attr_accessor :metodosTrait
  attr_accessor :estrategia

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

  ##Falta implementar
  ##Recibe un Trait y retorna una nueva instancia de Trait
  ##Que tiene todos los metodos
  def + unTrait
    traitAux= Trait.new()
    metodosT1={}.merge self.metodosTrait
    metodosT2= {}.merge unTrait.metodosTrait
    metodosT2.each do
      |unElemento|
      if !(metodosT1.has_key? unElemento[0])
        metodosT1[unElemento[0]]=unElemento[1]
      else                                  ## Se tira la excepcion ahora, otra podria ser guardar los metodos repetidos
        raise 'Se repite un método'         ## y ver que se puede hacer con ellos
      end
    end
    traitAux.metodosTrait=metodosT1
    traitAux
  end

  ##Falta implementar
  def - unMetodo
    traitAux= Trait.new()
    traitAux.metodosTrait={}.merge self.metodosTrait ##se usa el {}.merge para que se duplique el hash
    traitAux.metodosTrait.delete(unMetodo)
    traitAux
  end
end
