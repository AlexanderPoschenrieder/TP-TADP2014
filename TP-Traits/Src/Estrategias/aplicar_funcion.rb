require 'TP-Traits/Src/Estrategias/estrategia'

class Aplicar_funcion<Estrategia
  attr_accessor :una_funcion
  def initialize una_func
    self.una_funcion =una_func
  end

  def armar_metodo unBloque,otroBloque
    lambda{
      |*params|
    una_func(self.instance_exec(*params,&unBloque),self.instance_exec(*params,&otroBloque))
    }
  end

end