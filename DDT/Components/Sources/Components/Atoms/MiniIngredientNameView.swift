import SwiftUI

struct MiniIngredientNameView: View {
  let ingredient: Ingredient
}

extension MiniIngredientNameView {
  var body: some View {
    Text(ingredient.shortDescription)
  }
}

#Preview {
  MiniIngredientNameView(ingredient: Ingredient.water)
}
