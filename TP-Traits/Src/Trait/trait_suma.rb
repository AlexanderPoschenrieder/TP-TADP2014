require_relative '../../Src/Trait/trait'
require_relative 'conflicto'

class Trait_suma < Trait
  attr_accessor  :metodosConflictivos

  def initialize
    self.conflictos=false
    self.metodosConflictivos=[]
  end

  def sumar_metodos (metodos_t2)
    metodos_t2.each{|unElemento|
      if !tenes_metodo? unElemento
        incluir_metodo(unElemento)
      elsif existe_conflicto? unElemento
        agregar_mtd_al_conf(unElemento)
      else
        crear_conflicto(unElemento)
      end
    }
  end

  def crear_conflicto nombre_metodo
    self.conflictos=true
    unConflicto=Conflicto.new(nombre_metodo[0])
    unConflicto.agregar_conf metodosTrait[nombre_metodo[0]]
    unConflicto.agregar_conf nombre_metodo[1]
    metodosTrait.delete(nombre_metodo[0])   #elimina el metodo de la lista de metodos porque tiene conflicto
    metodosConflictivos<<unConflicto
  end

  def existe_conflicto? nombre_metodo
    metodosConflictivos.any?{|un_elemento| un_elemento.nombre_metodo==nombre_metodo[0]}
  end

  def agregar_mtd_al_conf nombre_metodo
    metodosConflictivos.first{|un_elemento| un_elemento.nombre_metodo==nombre_metodo[0]}.agregar_conf(nombre_metodo[1])
  end

  def incluir_metodo nombre_metodo
    metodosTrait.store(nombre_metodo[0],nombre_metodo[1])
  end

  def tenes_metodo? nombre_metodo
    metodosTrait.has_key? nombre_metodo[0]
  end

  def aplicar_estrategia unaEstrategia
    unaEstrategia.aplicar self
    #trait_aux=Trait.new()                             #no importa que no se clone el hash porque
    #trait_aux.metodosTrait=self.metodosTrait.clone    # el trait actual queda sin referencias y muere :(
    #trait_aux
  end
end