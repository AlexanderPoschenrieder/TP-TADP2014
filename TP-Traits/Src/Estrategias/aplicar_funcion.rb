require 'TP-Traits/Src/Estrategias/estrategia'

class Aplicar_funcion<Estrategia
  attr_accessor :una_funcion
  def initialize una_func
    self.una_funcion =una_func
  end

  def armar_metodo unBloque,otroBloque
    una_func(instance_eval(&unBloque),instance_eval(&otroBloque))
  end

end