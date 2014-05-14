require_relative 'estrategia'

class Ejecutar_en_orden <Estrategia

  def armar_metodo unBloque, otroBloque
    lambda{
      self.instance_exec &unBloque
      self.instance_exec &otroBloque
    }
  end
end