import SwiftUI

func desiredRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 22.22 ... 26.67 : 72 ... 80
}

func frictionRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 0 ... 22.22 : 0 ... 40
}

func defaultRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 7.22 ... 43.33 : 45 ... 110
}

func defaultTemp(inCelsius: Bool = false) -> Double {
  inCelsius ? 24.44 : 76
}

func defaultFriction(inCelsius: Bool = false) -> Double {
  inCelsius ? 13.33 : 24
}

func defaultHandFriction(inCelsius: Bool = false) -> Double {
  inCelsius ? 1 : 2
}

func tempScaleConversion(of temp: Double, toCelsius: Bool) -> Double {
  toCelsius ? fToC(temp) : cToF(temp)
}

func affineTempScaleConversion(of temp: Double, toCelsius: Bool) -> Double {
  toCelsius ? affineFToC(temp) : affineCToF(temp)
}

private func fToC(_ tempInF: Double) -> Double {
  (tempInF - 32) * 5 / 9
}

private func cToF(_ tempInC: Double) -> Double {
  tempInC  * 9 / 5 + 32
}

private func affineFToC(_ tempInF: Double) -> Double {
  tempInF * 5 / 9
}

private func affineCToF(_ tempInC: Double) -> Double {
  tempInC  * 9 / 5
}
