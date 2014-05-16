require 'rspec'
require '../../TP-Traits/Src/Trait/trait'
require '../../TP-Traits/Src/ClasesBase/clase'

describe 'My behaviour' do
  #-----------------------------------------------------------------------------
  #--------------Juego de datos-------------------------------------------------
  metodos1={
      :metodo1=> lambda{5},
      :metodo2=> lambda{6}
  }
  Trait.define(:ElGranTrait,metodos1)
  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  it 'resta el metodo1 al Trait' do
    nuevoTrait= ElGranTrait- :metodo1
    nuevoTrait.metodos.include?(:metodo1).should== false
  end

  it 'el primer Trait no se ve afectado' do
    ElGranTrait- :metodo1
    ElGranTrait.metodos.include?(:metodo1).should== true
  end

  it 'se agregan todos los metodos menos el restado' do
    class HolaMundo
      uses ElGranTrait- :metodo1
    end
    unHola=HolaMundo.new
    unHola.respond_to?(:metodo1).should== false
  end
end