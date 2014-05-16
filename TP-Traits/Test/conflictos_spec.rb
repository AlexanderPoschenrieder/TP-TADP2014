require 'rspec'
require '../Src/Trait/conflictos'

describe 'My behaviour' do

  it 'no debe tener conflictos cuando apenas se crea' do
    conflictos = Conflictos.new
    conflictos.existen?.should == false
  end

  it 'debe tener cuando se le agrega uno' do
    conflictos = Conflictos.new
    conflictos.agregar_metodo(:metodo1,lambda{1})
    conflictos.agregar_metodo(:metodo1,lambda{2})
    conflictos.existen?.should == true
  end

  it 'algo' do
    conflictos1 = Conflictos.new
    conflictos2 = Conflictos.new
    conflictos1.agregar_metodo(:metodo1,lambda{1})
    conflictos1.agregar_metodo(:metodo2,lambda{2})
    conflictos2.agregar_metodo(:metodo1,lambda{3})
    conflictos2.agregar_metodo(:metodo1,lambda{4})
    conflictos2.agregar_metodo(:metodo2,lambda{5})

    conflictos1.mergear(conflictos2)

    conflictos1.hashConflictos[:metodo1].length.should == 3
    conflictos1.hashConflictos[:metodo2].length.should == 2
  end


end