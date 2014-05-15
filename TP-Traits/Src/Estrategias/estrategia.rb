
class Estrategia
  def  aplicar(un_trait)
    un_trait.metodosConflictivos.each{
        |unConflicto|
      resolver_aridad unConflicto
      nombre_metodo=unConflicto.nombre_metodo
      un_trait.metodosTrait.store(
          nombre_metodo,
          armar_metodo(unConflicto)
      )
    }
    un_trait.conflictos=false #se resolvieron los conflictos
    un_trait
  end

  def resolver_aridad un_conflicto
    if !un_conflicto.bloques_conf[0].arity == un_conflicto.bloques_conf[1].arity
      raise("Existen dos métodos con el nombre:"+un_conflicto[0].to_s+" y con diferente aridad")
    end
  end
end