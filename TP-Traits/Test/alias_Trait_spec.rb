require 'rspec'
require '../../TP-Traits/Src/clase'
require '../../TP-Traits/Src/trait'
require '../../TP-Traits/Src/symbol'

describe 'My behaviour' do
  bloques1 = {
      :metodo1=> lambda{1},
      :metodo2=> lambda{2}
  }
  bloques2= {
      :metodo2=> lambda{3}
  }

  Trait.define(:UnTrait,bloques1)
  Trait.define(:OtroTrait,bloques2)
  class Clase1
    uses UnTrait<<(:metodo1>:nuevoMetodo1)
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
    UnTrait.metodosTrait[:metodo1].should_not==nil
  end
  it 'suma de traits con mismos metodos y sin conflicto' do
    unObjeto2.metodo2.should==2
    unObjeto2.metodo3.should==3
  end
end