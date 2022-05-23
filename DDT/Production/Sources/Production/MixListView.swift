import SwiftUI
import Persistence
import Components
import AppInfo

public struct MixListView {
  @EnvironmentObject private var appStatus: AppStatus
  @FetchRequest(entity: Mix.entity(),
                sortDescriptors: [NSSortDescriptor(key: "lastUsed",
                                                   ascending: false)])
  private var mixes: FetchedResults<Mix>
  
  public init(){}
}

extension MixListView: View {
  public var body: some View {
    NavigationView {
      List {
        ForEach(mixes) {mix in
          VStack(alignment: .leading, spacing: 20) {
            Text(mix.name)
              .font(.title2)
            HStack {
              Text("DDT: \(mix.desiredDoughTemperature.tempDisplay(appStatus.isCelsius))")
              Spacer()
              Text("Fr: \(mix.frictionCoefficient.affineTempDisplay(appStatus.isCelsius))")
              Spacer()
              HStack {
                Text("PF:")
              Image(systemName: mix.hasPreferment ? "checkmark.circle" : "xmark.circle")
              }
            }
            .foregroundColor(.secondary)
          }
          .padding(.vertical)
          .listRowSeparatorTint(.cyan)
        }
              .onDelete { indexSet in
                if let index = indexSet.first {
                  sharedViewContext.delete(mixes[index])
                  try? sharedViewContext.save()
        //          deleteStation(at: index)
//                  stationList.deleteStation(at: index,
//                                            currentlyPlaying: currentlyPlaying)
                }
              }
//        .onMove{ indexSet, offset in
//          if let index = indexSet.first {
//            stationList.moveStation(at: index, offset: offset)
//          }
//        }
//        .onChange(of: currentlyPlaying.station) {currentStation in
//          if let currentStation = currentStation {
//            print("button number", currentStation.buttonNumber)
//            stationList.moveStation(at: currentStation.buttonNumber - 1, offset: 0)
//          }
//        }
//      }
      }
      .navigationTitle("Production")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

//TODO: Friction needs an affine transformation


struct MixListView_Previews: PreviewProvider {
  static var previews: some View {
    MixListView()
  }
}
