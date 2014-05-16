require 'rspec'
require  '../../TP-Traits/Src/Estrategias/ejecutar_en_orden'
require '../Src/Trait/trait_suma'
require '../../TP-Traits/Src/ClasesBase/clase'

describe 'My behaviour' do

  Trait.define do
    nombre :Trait1
    metodo :metodo1 do
      self.numero=1
    end
  end

  Trait.define do
    nombre :Trait2
    metodo :metodo do
      self.numero2=2
    end
    metodo :metodo1 do
      self.numero= self.numero+2
    end
  end

  Trait.define do
    nombre :Trait3
    metodo :metodo1 do
    |unNumero,otroNumero| puts '1';self.numero=unNumero+otroNumero
    end
  end

  Trait.define do
    nombre :Trait4
    metodo :metodo1 do
    |unNumero,otroNumero|
      puts'2';
      self.numero=self.numero+unNumero+otroNumero
    end
  end

  Trait.define do
    nombre :Trait5
    metodo :metodo1 do
    |unNumero,otroNumero|
      puts'3';
      self.numero=self.numero/2
    end
  end


  class Clase1
    attr_accessor :numero
    uses (Trait1+Trait2).aplicar_estrategia(Ejecutar_en_orden.new)
  end
  class Clase2
    attr_accessor :numero
  end
  class Clase4
    attr_accessor :numero
    uses (Trait3+Trait4).aplicar_estrategia(Ejecutar_en_orden.new)
  end

  class Clase5
    attr_accessor :numero
    unTrait = (Trait3+Trait4+Trait5)
    unTrait.aplicar_estrategia(Ejecutar_en_orden.new)
    uses unTrait
  end

  it 'usa Estrategia ejecutar en orden' do
    unObjeto= Clase1.new
    unObjeto.metodo1
    unObjeto.numero.should==3
  end

  it 'pincha si sumamos dos metodos con distinta aridad' do
    expect{Clase2.uses(Trait1+Trait3).aplicar_estrategia(Ejecutar_en_orden.new)}.to raise_error
  end

  it 'suma de dos metodos con varios parametros' do
    unObjeto= Clase4.new
    unObjeto.metodo1(4,4)
    unObjeto.numero.should== 16
  end

  it 'suma mas de dos metodos con varios parametros' do
    unObjeto= Clase5.new
    unObjeto.metodo1(4,4)
    unObjeto.numero.should==8
  end

  it 'prueba de estrategia con función' do
      #sin implementar
  end

end