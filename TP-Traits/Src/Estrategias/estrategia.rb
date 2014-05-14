class Estrategia
  def  aplicar(un_trait)           #lo defini como metodo de clase para usar el nombre de la clase
    un_trait.metodosConflictivos.each{   #para que sea mas facil acceder aunque no se si es lo mejor
        |unConflicto|
      resolver_aridad unConflicto
      nombre_metodo=unConflicto[0]
      un_trait.metodosTrait.store(nombre_metodo, armar_metodo(unConflicto[1][0],unConflicto[1][1])) #aca ocurre un problema con el contexto donde se ejecuta
    }
    un_trait
  end

  def resolver_aridad un_conflicto
    if !un_conflicto[1][0].arity == un_conflicto[1][1]
      raise('Existen dos métodos con el nombre:'+un_conflicto[0].to_s+' y con diferente aridad')
    end
  end
end