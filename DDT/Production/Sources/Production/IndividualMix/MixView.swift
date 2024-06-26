import SwiftUI
import Persistence
import Components


struct MixView {
  var mix: Mix
  @State private var finalDoughTemp: Double = Ingredient.friction.defaultTemp
  @State private var temperatures = IngredientTemperature()
  @Environment(\.modelContext) private var modelContext
}

extension MixView: View {
  var body: some View {
    List {
      Section {
        WaterDisplay(temperatures)
      }
      Section {
        TemperatureDisplay(mix.desiredDoughTemperature,
                           for: .ddt)
        AmbientView(temperatures: temperatures)
        FlourView(temperatures: temperatures)
        if mix.hasPreferment {
          PrefermentView(temperatures: temperatures)
        }
      }
      FrictionSection(temperatures: temperatures)
    }
    .onAppear {
      temperatures.ddt = mix.desiredDoughTemperature
      temperatures.friction = mix.frictionCoefficient
      mix.lastUsed = Date()
      do {
        try modelContext.save()
      } catch {
        print("couldn't save date update")
      }
      
    }
    .onDisappear {
      mix.frictionCoefficient = temperatures.friction
    }
    .navigationTitle(mix.name)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        ShareLink(item: mix.url,
        subject: Text("Formula shared from DDT app"),
                  message: Text("Link to \(mix.name) DDT formula"))
      }
    }
  }
}

#Preview(traits: .mixPreviewData) {
  MixView(mix: Mix.sampleMix)
}

