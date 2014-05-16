require_relative 'estrategia'

class Ejecutar_en_orden <Estrategia

  def armar_metodo arrayBloques
    lambda{
      |*parametros|
      arrayBloques.each{
        |unBloque|
        self.instance_exec *parametros, &unBloque
      }
    }
  end
end