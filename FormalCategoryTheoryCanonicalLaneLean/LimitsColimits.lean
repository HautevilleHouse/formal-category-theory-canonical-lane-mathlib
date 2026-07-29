import HautevilleHouse.FormalCategoryTheoryCanonicalLaneLean.AdmissibleClass
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.CategoryTheory.Limits.Shapes.Equalizers

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure LimitsPackage (A : AdmissibleClass) where
  hasProducts : ∀ (I : Type u), HasLimitsOfShape (Discrete I) A.object
  hasEqualizers : HasEqualizers A.object
  limitExistence : ∀ (J : Type u) [SmallCategory J] (F : J ⥤ A.object), HasLimit F

def LimitsClosed (P : LimitsPackage) : Prop :=
  P.hasProducts ∧ P.hasEqualizers ∧ P.limitExistence

theorem limits_closed (P : LimitsPackage) : LimitsClosed P := by
  exact And.intro P.hasProducts (And.intro P.hasEqualizers P.limitExistence)

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse