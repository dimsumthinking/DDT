import Testing
@testable import Components

@Suite("Water temp calculations")
struct IngredientTemperatureTests {
  let pf = IngredientTemperature(ddt: 80,
                                 friction: 2,
                                 hasPreferment: true)
  let noPF = IngredientTemperature(ddt: 80,
                                   friction: 2,
                                   hasPreferment: false)
  
  @Test("Water temp calculation with preferment", .tags(Tag.preferment))
  func pfWaterTemp() {
    #expect(pf.waterTemperature() == 90)
  }
  
  @Test("Water temp calculation without preferment")
  func noPFWaterTemp() {
    #expect(noPF.waterTemperature() == 86)
  }
  
}

