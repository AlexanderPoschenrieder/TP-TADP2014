require_relative '../../Src/Trait/trait'
require_relative 'conflictos'

class Trait_suma < Trait
  attr_accessor  :metodosConflictivos

  def initialize
    self.conflictos=false
    self.metodosConflictivos=[]
  end

  def sumar_metodos (metodos_t2)
    metodos_t2.each{|unMetodo|
      if !tenes_metodo? unMetodo
        incluir_metodo(unMetodo)
      elsif existe_conflicto? unMetodo
        agregar_mtd_al_conf(unMetodo)
      else
        crear_conflicto(unMetodo)
      end
    }
  end



  def existe_conflicto? metodo
    metodosConflictivos.any?{|un_elemento| un_elemento.nombre_metodo==metodo[0]}
  end

  def agregar_mtd_al_conf metodo
    metodosConflictivos.first{|un_elemento| un_elemento.nombre_metodo==metodo[0]}.agregar_conf(metodo[1])
  end

  def incluir_metodo metodo
    metodosTrait.store(metodo[0],metodo[1])
  end


end