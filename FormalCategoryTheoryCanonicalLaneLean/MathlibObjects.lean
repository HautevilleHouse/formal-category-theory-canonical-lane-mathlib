import FormalCategoryTheoryCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlibCore
import Mathlib.CategoryTheory.Basic

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CategorySpace where
  carrier : Type u
  categoryStructure : CategoryTheory.Category carrier

structure CategoryAdmittedObject where
  space : CategorySpace
  complete : Prop
  cocomplete : Prop
  abelian : Prop
  conclusion : complete ∧ cocomplete ∧ abelian

structure CategoryEndgameState where
  object : CategoryAdmittedObject

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.conclusion

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse
