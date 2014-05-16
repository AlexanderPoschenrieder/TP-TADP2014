require 'rspec'
require '../../TP-Traits/Src/ClasesBase/clase'
require '../../TP-Traits/Src/Trait/trait_suma'

describe 'Suma de dos traits' do
  #-----------------------------------------------------------------------------
  #--------------Juego de datos-------------------------------------------------

  Trait.define do
    nombre :UnTrait
    metodo :metodo1 do
      1
    end
    metodo :metodo2 do
      2
    end
  end

  Trait.define do
    nombre :OtroTrait
    metodo :metodo2 do
      3
    end
  end

  Trait.define do
    nombre :UnTraitComun

    metodo :metodo3 do
      4
    end
  end

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
    OtroTrait.metodos[:metodo3].should== nil
  end

  it 'verificar que los metodos conflictivos queden registrados' do

    nuevoTrait= UnTrait + OtroTrait
    nuevoTrait.conflictos.hashConflictos.has_key?(:metodo2).should== true
  end
end