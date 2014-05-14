require_relative 'estrategia'

class Ejecutar_en_orden <Estrategia

  def armar_metodo unBloque, otroBloque
    lambda{
      |*parametros|
      self.instance_exec parametros, &unBloque
      self.instance_exec parametros, &otroBloque
    }
  end
end