require 'rspec'
require '../../TP-Traits/Src/Trait/trait_suma'
require '../../TP-Traits/Src/ClasesBase/clase'

describe 'El metodo Uses agrega los metodos' do
  #-----------------------------------------------------------------------------
  #--------------Juego de datos-------------------------------------------------
  bloques={
        :miNumeroFavoritoEs=>lambda{3},
        :devuelve5 =>lambda{5},
        :devuelveTuNumero => lambda{unNumero},
        :devuelveEstosNumeros=> lambda{|numero1,numero2,numero3|[numero1,numero2,numero3]}
     }

    Trait.define(:TraitLoco,bloques)

    class Devuelve_numero6
      uses TraitLoco
      def miNumeroFavoritoEs
        6
      end
    end
    class Devuelve_numero5y3
      uses TraitLoco
    end
    class Numero_cualquiera
      attr_accessor :unNumero
      uses TraitLoco
    end

    numero6= Devuelve_numero6.new
    numero5=Devuelve_numero5y3.new
    numeroModificable= Numero_cualquiera.new
    numeroModificable.unNumero= 7
    numeroModificable2=Numero_cualquiera.new
    numeroModificable2.unNumero= 9
  #-----------------------------------------------------------------------------
  #-----------------------------------------------------------------------------
  it 'chequea que se agreguen los metodos' do
    numero5.miNumeroFavoritoEs.should==3
    numero5.devuelve5.should== 5
  end

  it 'chequea que no se pisen los metodos' do
    numero6.miNumeroFavoritoEs.should==6
  end

  it 'chequea que los metodos nuevos puedan acceder al estado interno' do
    numeroModificable.devuelveTuNumero.should==7
    numeroModificable2.devuelveTuNumero.should==9
  end
  it 'chequea que se pueda modificar el estado interno' do
    numeroModificable.unNumero =8
    numeroModificable.devuelveTuNumero.should==8
  end
  it 'prueba con métodos con argumentos' do
    numeroModificable.devuelveEstosNumeros(1,2,3).should== [1,2,3]
  end
end

