//import SwiftUI
//import Persistence
//import Components
//import HelperViews
//import AppInfo
//import ComponentViews
//
//
//struct NewMixView {
//  @State private var name: String = ""
//  @State private var ddt: Double = Component.ddt.defaultTemp
//  @State private var friction: Double = Component.friction.defaultTemp
//  @State private var hasPreferment: Bool = true
//  @Binding var isCreatingMix: Bool
//  @FetchRequest(entity: Mix.entity(),
//                sortDescriptors: [NSSortDescriptor(key: "name",
//                                                   ascending: true)])
//  private var mixes: FetchedResults<Mix>
//  
//}
//
//extension NewMixView: View {
//  var body: some View {
//    List {
//      Section {
//        NameEntryView(name: $name)
//        if nameExists {
//          HStack {
//            Spacer()
//            Text("This mix name already exists")
//              .font(.caption)
//              .foregroundColor(.red )
//            Spacer()
//          }
//        }
//      }
//      Section {
//        ComponentView(.ddt,
//                      temperature: $ddt)
//        ComponentView(.friction,
//                      temperature: $friction)
//        Toggle("Has preferment:", isOn: $hasPreferment)
//          .padding(.vertical)
//      }
//      HStack {
//        Spacer()
//        Button("Dismiss", role: .cancel, action: dismiss)
//        Spacer()
//        Button("Save", action: save)
//          .disabled(name.count < 4 || nameExists)
//        Spacer()
//      }
//    }
//  }
//}
//
//extension NewMixView {
//  private func dismiss() {
//    isCreatingMix = false
//  }
//  private func save() {
//    dismiss()
//    _ = Mix(name: name,
//            desiredDoughTemperature: ddt,
//            frictionCoefficient: friction,
//            hasPreferment: hasPreferment,
//            context: newBackgroundContext()
//    )
//  }
//  private var nameExists: Bool {
//    mixes.map{mix in mix.name.lowercased()}.contains(name.lowercased())
//  }
//}
//
////struct NewMixView_Previews: PreviewProvider {
////  static var previews: some View {
////    NewMixView()
////  }
////}
