import SwiftUI
import SwiftData

struct MixPreviewData: PreviewModifier {
  static func makeSharedContext() throws -> ModelContainer {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Mix.self, configurations: config)
    let context = ModelContext(container)
    for mix in Mix.sampleMixes {
      context.insert( mix)
    }
    try context.save()
    return container
  }
  
  func body(content: Content, context: ModelContainer) -> some View {
    content.modelContainer(context)
  }
}

extension Mix {
  public static var sampleMix: Mix {
    Mix(name: "Sample Dough",
        desiredDoughTemperature: 80,
        frictionCoefficient: 2,
        hasPreferment: true)

  }
  public static var sampleMixes: [Mix] {
    [Mix(name: "Epi",
        desiredDoughTemperature: 78,
        frictionCoefficient: 2,
        hasPreferment: false),
     Mix(name: "Batard",
         desiredDoughTemperature: 80,
         frictionCoefficient: 2,
         hasPreferment: false),
      Mix(name: "Sour Dough",
          desiredDoughTemperature: 82,
          frictionCoefficient: 12,
          hasPreferment: true),
       Mix(name: "Rye",
           desiredDoughTemperature: 76,
           frictionCoefficient: 12,
           hasPreferment: true)]

  }
}

extension PreviewTrait where T == Preview.ViewTraits {
  @MainActor public static var mixPreviewData: Self = .modifier(MixPreviewData())
}
