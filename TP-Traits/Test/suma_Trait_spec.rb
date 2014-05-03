require 'rspec'
require '../../TP-Traits/Src/clase'
require '../../TP-Traits/Src/trait'

describe 'Suma de dos traits' do
  #-----------------------------------------------------------------------------
  #--------------Juego de datos-------------------------------------------------
  bloques1 = {
      :metodo1=> lambda{1},
      :metodo2=> lambda{2}
  }
  bloques2= {
      :metodo2=> lambda{3}
  }
  bloques3={
      :metodo3=> lambda{4}
  }

  Trait.define(:UnTrait,bloques1)
  Trait.define(:OtroTrait,bloques2)
  Trait.define(:UnTraitComun,bloques3)

  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------

  it 'se suman dos traits' do

    class ClaseNueva
      uses(UnTrait + UnTraitComun)
    end

    unObjeto= ClaseNueva.new
    unObjeto.metodo1.should== 1
    unObjeto.metodo2.should== 2
    unObjeto.metodo3.should== 4
  end

  it 'la suma no afecta a los traits originales' do
    OtroTrait + UnTraitComun
    OtroTrait.metodosTrait[:metodo3].should== nil
  end

  it 'verificar que los metodos conflictivos queden registrados' do

    nuevoTrait= UnTrait + OtroTrait
    nuevoTrait.metodosConflictivos.has_key?(:metodo2).should== true

  end

end