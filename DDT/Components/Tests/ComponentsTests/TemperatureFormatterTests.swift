import Testing
@testable import Components

@Suite("Temperature Formatter")
struct TemperatureFormatterTests {
 
  @Suite("Non-affine")
  struct NonAffine {
    let ddt50 = 50.displayTemperature(for: .ddt)

    @Test("DDT display for F")
    func fahrenheitddt() async throws {
      #expect( ddt50(false) == "50.0 ºF")
    }
    
    @Test("DDT display for C", .tags(Tag.celsius))
    func celciusddt() async throws {
      #expect( ddt50(true) == "10.0 ºC")
    }
  }
  
  @Suite("Affine")
  struct Affine {
    let friction50 = 50.displayTemperature(for: .friction)
    
    @Test("Friction display for F", .tags(Tag.friction))
    func fahrenheitfriction() async throws {
      #expect( friction50(false) == "50.0 ºF")
    }
    
    @Test("Friction display for C", .tags(Tag.friction, Tag.celsius))
    func celciusfriction() async throws {
      #expect( friction50(true) == "27.8 ºC")
    }
  }
}
