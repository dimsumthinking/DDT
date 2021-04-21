//
//  HelpView.swift
//  DDT
//
//  Created by Daniel Steinberg on 4/21/21.
//

import SwiftUI

struct HelpView {
  @Binding var isShowingHelp: Bool
}
extension HelpView: View {
    var body: some View {
        Text("Help View")
    }
}

//struct HelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        HelpView()
//    }
//}
