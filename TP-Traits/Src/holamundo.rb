require '../../TP-Traits/Src/trait.rb'

class Class
  def uses (unTrait)
    unTrait.agregarMetodos(self)
  end
end

bloques={
    :holiss_mundo=>lambda{puts 'holiss mundis'},
    :holaAle =>lambda{puts 'que haces ale wachiturro'}}

Trait.define(:TraitLoco,bloques)


class Holamundo
  uses TraitLoco
  def holiss_mundo
    puts 'concha tu madre'
  end

end
holiss= Holamundo.new
holiss.holiss_mundo
holiss.holaAle

