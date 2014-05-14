require 'rspec'
require  '../../TP-Traits/Src/Estrategias/ejecutar_en_orden'
require '../Src/Trait/trait_suma'
require '../../TP-Traits/Src/ClasesBase/clase'

describe 'My behaviour' do
  bloques1 = {
      :metodo1=> Proc.new{self.numero= 1}
  }

  bloques2= {
      :metodo2=> Proc.new{self.numero2=2},
      :metodo1=> Proc.new{self.numero= self.numero+2}
  }
  bloques3={
      :metodo1=> Proc.new{|unNumero| self.numero=unNumero}
  }
  bloques4= {
      :metodo1 => Proc.new{|unNumero| self.numero=self.numero+unNumero}
  }

  Trait.define(:Trait1,bloques1)
  Trait.define(:Trait2,bloques2)
  Trait.define(:Trait3,bloques3)
  Trait.define(:Trait4,bloques4)

  class Clase1
    attr_accessor :numero
    uses (Trait1+Trait2).aplicar_estrategia(Ejecutar_en_orden.new)
  end
  class Clase2
    attr_accessor :numero
  end
  #class Clase4
  #  attr_accessor :numero
  #  uses (Trait3+Trait4).aplicar_estrategia(Ejecutar_en_orden.new)
  #end

  it 'usa Estrategia ejecutar en orden' do
    unObjeto= Clase1.new
    unObjeto.metodo1
    unObjeto.numero.should==3
  end

  it 'pincha si sumamos dos metodos con distinta aridad' do
    expect{Clase2.uses(Trait1+Trait3).aplicar_estrategia(Ejecutar_en_orden.new)}.to raise_error
  end

  #it 'suma de dos metodos con varios parametros' do
  #  unObjeto= Clase4.new
  #  unObjeto.metodo1(4)
  #  unObjeto.numero.should== 8
  #end

end