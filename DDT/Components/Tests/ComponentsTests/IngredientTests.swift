import Testing
@testable import Components

@Suite("Ingredient Basics")
struct IngredientTests {
  
  @Suite("Ingredient Name Display")
  struct Names {
    let ddt = Ingredient.ddt
    
    @Test("DDT full name")
    func ddtName() {
      #expect(ddt.description == "Desired Dough Temp")
    }
    
    
    @Test("DDT short name")
    func ddtShortName() {
      #expect(ddt.shortDescription == "DDT")
    }
  }
  
  @Suite("Initial Values")
  struct Values {
    let friction = Ingredient.friction
    
    @Test("Default temp for friction", .tags(Tag.friction))
    func frictionDefault() {
      #expect(friction.defaultTemp == 2)
    }
    
    @Test("Default range for friction", .tags(Tag.friction))
    func frictionRange() {
      #expect(friction.range ==  0.0...40.0)
    }
  }
}

