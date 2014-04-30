require 'rspec'
require '../../TP-Traits/Src/trait.rb'
require '../../TP-Traits/Src/clase.rb'

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

  Trait.define(:UnSeñorTrait,bloques1)
  Trait.define(:OtroSeñorTrait,bloques2)
  Trait.define(:UnTraitComun,bloques3)

  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------

  it 'se suman dos traits' do

    class ClaseNueva
      uses UnSeñorTrait+UnTraitComun
    end

    unObjeto= ClaseNueva.new()
    unObjeto.metodo1.should==1
    unObjeto.metodo2.should==2
    unObjeto.metodo3.should==4
  end

  it 'tira excepción' do
    expect {UnSeñorTrait+OtroSeñorTrait}.to raise_error
  end

  it 'la suma no afecta a los traits originales' do
    UnSeñorTrait+UnTraitComun
    UnSeñorTrait.metodosTrait[:metodo3].should== nil
  end

end