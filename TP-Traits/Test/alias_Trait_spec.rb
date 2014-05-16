require 'rspec'
require '../../TP-Traits/Src/ClasesBase/clase'
require '../../TP-Traits/Src/Trait/trait_suma'
require '../../TP-Traits/Src/ClasesBase/clase'
require '../../TP-Traits/Src/ClasesBase/symbol'


describe 'My behaviour' do

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

  class Clase1
    uses UnTrait <<(:metodo1>:nuevoMetodo1)
  end

  class Clase2
    uses UnTrait + (OtroTrait<<(:metodo2>:metodo3))
  end
  unObjeto= Clase1.new()
  unObjeto2= Clase2.new()
  it 'modificar el nombre de un metodo' do

    unObjeto.nuevoMetodo1.should==1
  end

  it 'deja de contener el metodo cambiado' do
    unObjeto.respond_to?(:metodo1).should==false
  end

  it 'no se modifica el trait original' do
    UnTrait.metodos[:metodo1].should_not==nil
  end
  it 'suma de traits con mismos metodos y sin conflicto' do
    unObjeto2.metodo2.should==2
    unObjeto2.metodo3.should==3
  end
end