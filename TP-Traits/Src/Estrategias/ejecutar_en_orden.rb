require_relative 'estrategia'

class Ejecutar_en_orden <Estrategia

  def armar_metodo unConflicto
    lambda{
      |*parametros|
      unConflicto.bloques_conf.each{
        |unBloque|
        self.instance_exec *parametros, &unBloque
      }
    }
  end
end