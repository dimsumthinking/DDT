import SwiftUI

func desiredRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 22.22 ... 26.67 : 72 ... 80
}

func defaultRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 50 ... 43.33 : 72 ... 80
}

func frictionRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? -17.78 ... 4.44 : 0 ... 40
}

func actualRange(inCelsius: Bool) -> ClosedRange<Double> {
  inCelsius ? 15.56 ... 33.33 : 60 ... 92
}

func defaultTemp(inCelsius: Bool = false) -> Double {
  inCelsius ? 24.44 : 76
}

func defaultFriction(inCelsius: Bool = false) -> Double {
  inCelsius ? -6.67 : 20
}