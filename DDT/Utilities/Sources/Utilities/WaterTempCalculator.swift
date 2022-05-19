public func waterTempFrom(ddt: Double,
                          flourTemp: Double,
                          ambientTemp: Double,
                          prefermentTemp: Double?,
                          frictionTemp: Double) -> Double {
  if let prefermentTemp =  prefermentTemp {
    return ddt * 4 - flourTemp - ambientTemp - frictionTemp - prefermentTemp
  } else {
    return ddt * 3 - flourTemp - ambientTemp - frictionTemp
  }
}
