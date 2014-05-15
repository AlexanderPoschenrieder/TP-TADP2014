require 'TP-Traits/Src/Estrategias/estrategia'

class Ultimo_valor_de_retornom< Estrategia
  attr_accessor :condicion

  def armar_metodo unBloque,otroBloque
    lambda{
      |*params|
      if condicion.call(un_retorno=self.instance_exec *params, &unBloque)
        return un_retorno
      else

    }
  end
end