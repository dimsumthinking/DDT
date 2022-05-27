import Foundation
import AppInfo

struct HelpScreenItem {
  let type: TabType
  let heading: String
  let body: String
}

extension HelpScreenItem: Identifiable {
  var id: Int {
    body.hash
  }
}

let helpScreens: [HelpScreenItem] = [
  HelpScreenItem(type: .singleBake, heading: "Single Bake", body:
"""
Enter the Desired Dough Temperature.

The ideal range is 75 - 78 º F  or 24 - 25.5 º C.

Enter room temperature as the ambient value and also enter your flour temp.

If there's a preferment enter its temperature.

The Water temperature is updated with each change.

Measure your water at this temperature to achieve your desired dough temperature. This simple change will improve your bread.
"""),
  HelpScreenItem(type: .friction, heading: "Friction", body:
  """
To set the friction factor when creating a new mix, use the buttons to start with 24ºF/13ºC for machine mixing or 2ºF/1ºC for hand mixing.

To tune the friction factor in Single Bake mode, measure the actual dough temperature and raise or lower the friction factor by the difference between the actual dough temperature and the desired dough temperature.

In Production mode this adjustment will be made for you if you enter the final dough temperature that you measure after the mix is complete.
"""),
  HelpScreenItem(type: .production, heading: "Production Bake", body:
  """
You can save mixes from the Single Bake tab or create new mixes in the Production tab using the '+' button.

You'll provide a name for the mix, specify the DDT and Friction, and indicate whether or not this mix has a preferment.

Find your saved bakes in the Production tab and tap them to enter the temperatures you need to determine the water temperature.
""")
]

