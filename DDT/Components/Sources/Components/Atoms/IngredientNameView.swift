import SwiftUI

struct IngredientNameView: View {
  let ingredient: Ingredient
}

extension IngredientNameView {
  var body: some View {
    HStack {
      Text(ingredient.description)
      Spacer()
    }
  }
}

#Preview {
  IngredientNameView(ingredient: Ingredient.water)
}
