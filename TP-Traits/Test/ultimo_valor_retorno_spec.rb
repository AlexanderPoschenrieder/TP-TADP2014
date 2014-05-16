require 'rspec'
require '../../TP-Traits/Src/Estrategias/ultimo_valor_de_retorno'
require '../../TP-Traits/Src/Trait/trait'
require '../Src/Trait/trait_suma'
require '../../TP-Traits/Src/ClasesBase/clase'

describe 'Estrategia ultimo valor de retorno' do

  Trait.define do
    nombre :Trait6
    metodo :metodo1 do
      1
    end
  end

  Trait.define do
    nombre :Trait7
    metodo :metodo1 do
      -1
    end
  end

  class ClaseUltimoValor
    unTrait = (Trait6 + Trait7)
    una_funcion = Proc.new{|numero| numero > 0}
    unTrait.aplicar_estrategia(Ultimo_valor_de_retorno.new(una_funcion))
    uses(unTrait)
  end

  it 'prueba de estrategia con funcion' do
    objetoValorRetorno = ClaseUltimoValor.new
    objetoValorRetorno.metodo1.should == 1
  end

end