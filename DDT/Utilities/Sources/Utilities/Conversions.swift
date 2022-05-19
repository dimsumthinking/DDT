extension Double {
  
  public func tempScaleConversion(toCelsius: Bool) -> Double {
    toCelsius ? self.fToC : self.cToF
  }
  
  public func affineTempScaleConversion(toCelsius: Bool) -> Double {
    toCelsius ? self.affineFToC : self.affineCToF
  }
  
  public var fToC: Double {
    (self - 32) * 5 / 9
  }
  
  public var cToF: Double {
    self  * 9 / 5 + 32
  }
  
  public var affineFToC: Double {
    self * 5 / 9
  }
  
  public var affineCToF: Double {
    self  * 9 / 5
  }
}
