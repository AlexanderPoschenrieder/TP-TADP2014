require_relative 'estrategia'

class Ejecutar_en_orden <Estrategia
  def  aplicar(un_trait)           #lo defini como metodo de clase para usar el nombre de la clase
   un_trait.metodosConflictivos.each{   #para que sea mas facil acceder aunque no se si es lo mejor
     |unConflicto|
     nombre_metodo=unConflicto[0]
     un_trait.metodosTrait.store(nombre_metodo, armar_metodo(unConflicto[1][0],unConflicto[1][1])) #aca ocurre un problema con el contexto donde se ejecuta
   }
  un_trait
  end

  def armar_metodo unBloque, otroBloque
    lambda{
        self.instance_eval unBloque
        self.instance_eval otroBloque
    }
  end
end