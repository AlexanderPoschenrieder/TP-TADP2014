require_relative 'estrategia'

class Ultimo_valor_de_retorno < Estrategia
  attr_accessor :condicion

  def initialize(una_funcion)
    @condicion = una_funcion
  end

  def armar_metodo(arrayBloques)
    arrayBloques.each{
        |bloq|
      if condicion.call(un_retorno = self.instance_exec(*params, &bloq))
        return un_retorno
      end
    }
    # lambda{
    #   |*params|
    #   if condicion.call(un_retorno = self.instance_exec *params, &unBloque)
    #     return un_retorno
    #   end
    # }
  end
end