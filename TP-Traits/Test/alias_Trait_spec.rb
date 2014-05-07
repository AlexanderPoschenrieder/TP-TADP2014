require 'rspec'
require '../../TP-Traits/Src/clase'
require '../../TP-Traits/Src/trait'
require '../../TP-Traits/Src/symbol'

describe 'My behaviour' do
  bloques1 = {
      :metodo1=> lambda{1},
      :metodo2=> lambda{2}
  }
  Trait.define(:UnTrait,bloques1)

  it 'modificar el nombre de un metodo' do
    class Clase1
      uses UnTrait<<(:metodo1>:nuevoMetodo1)
    end

    unObjeto= Clase1.new()
    unObjeto.nuevoMetodo1.should==1
  end

  it 'deja de contener el metodo cambiado' do
    class Clase2
      uses UnTrait <<(:metodo1>:nuevoMetodo1)
    end
    unObjeto= Clase2.new()
    unObjeto.respond_to?(:metodo1).should==false
  end

  it 'no se modifica el trait original' do

    class Clase3
      uses UnTrait<< (:metodo1>:nuevoMetodo1)
    end

    UnTrait.metodosTrait[:metodo1].should_not==nil
  end
end