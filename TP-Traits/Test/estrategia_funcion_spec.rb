require 'rspec'
require '../../TP-Traits/Src/ClasesBase/clase'
require '../Src/Trait/trait'
require '../../TP-Traits/Src/Estrategias/aplicar_funcion'

describe 'My behaviour' do

  Trait.define do
    nombre :Trait3
    metodo :metodo1 do
    |unNumero,otroNumero| puts self;self.numero=unNumero+otroNumero
    end
  end

  Trait.define do
    nombre :Trait4
    metodo :metodo1 do
    |unNumero,otroNumero|
      puts self
      self.numero=self.numero+unNumero+otroNumero
    end
  end

  class Clase6
    attr_accessor :numero
    def initialize
      self.numero=0
    end
    uses (Trait3+Trait4).aplicar_estrategia(Aplicar_funcion.new(lambda{|primero,segundo| primero+segundo}))
  end

  it 'prueba de estrategia con función' do
    unObjeto=Clase6.new
    unObjeto.metodo1(4,4).should==24
  end
end