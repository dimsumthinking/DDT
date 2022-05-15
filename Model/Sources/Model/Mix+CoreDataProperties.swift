//
//  Mix+CoreDataProperties.swift
//  DDT
//
//  Created by Daniel Steinberg on 5/15/22.
//
//

import Foundation
import CoreData


extension Mix {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mix> {
        return NSFetchRequest<Mix>(entityName: "Mix")
    }

    @NSManaged public var name: String
    @NSManaged public var desiredDoughTemperature: Double
    @NSManaged public var isFahrenheit: Bool
    @NSManaged public var hasPreferment: Bool
    @NSManaged public var frictionCoefficient: Double
    @NSManaged public var isFrictionUpdatable: Bool
}

extension Mix: Identifiable {}

extension Mix: Equatable {
  static func ==(lhs: Mix, rhs: Mix) -> Bool {
    lhs.name = rhs.name
  }
}

extension Mix: {
  var ddtInF: Double {
    desiredDoughTemperature
  }
  var ddtInC: Double {
    desiredDoughTemperature.toC
  }
  var ffInF: Double {
    frictionCoefficient
  }
  var ffInC: Double {
    frictionCoefficient.toC
  }
}

extension Double {
  fileprivate var toC: Double {
    (self - 32) * 5/9
  }
}
