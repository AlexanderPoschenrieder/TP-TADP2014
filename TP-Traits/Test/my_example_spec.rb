require 'rspec'
require '../../TP-Traits/Src/trait.rb'
require '../../TP-Traits/Src/holamundo.rb'

describe 'My behaviour' do
     bloques={
        :miNumeroFavoritoEs=>lambda{3},
        :devuelve5 =>lambda{5}}


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

    numero6= Devuelve_numero6.new
    numero5=Devuelve_numero5y3.new

  it 'chequea que se agreguen los metodos' do
    numero5.miNumeroFavoritoEs.should==3
    numero5.devuelve5.should== 5
  end

  it 'chequea que no se pisen los metodos' do
    numero6.miNumeroFavoritoEs.should==6
  end

end