require_relative 'estrategia'

class Aplicar_funcion<Estrategia
  attr_accessor :una_funcion
  def initialize una_func
    self.una_funcion =una_func
  end

  def armar_metodo arrayBloques
    unaFunc=self.una_funcion
    lambda{
      |*params|
      resultado=0
      i=0
      arrayBloques.each{
        |unBloque|
        if i==0
          resultado=self.instance_exec(*params,&unBloque)
          i=i+1
        else
          resultado=unaFunc.call(resultado,self.instance_exec( *params,&unBloque))
          i=i+1
        end
      }
      resultado
    }
  end
end