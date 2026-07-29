import FormalCategoryTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure AdjunctionPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unitCounit : Prop
  triangleIdentities : Prop
  homSetBijection : Prop

structure AdjunctionEvidence (A : AdjunctionPackage) where
  unitCounitClosed : A.unitCounit
  triangleIdentitiesClosed : A.triangleIdentities
  homSetBijectionClosed : A.homSetBijection

def AdjunctionClosed (A : AdjunctionPackage) : Prop :=
  A.unitCounit ∧ A.triangleIdentities ∧ A.homSetBijection

theorem adjunction_closed_from_evidence (A : AdjunctionPackage) (E : AdjunctionEvidence A) :
    AdjunctionClosed A := by
  exact And.intro E.unitCounitClosed (And.intro E.triangleIdentitiesClosed E.homSetBijectionClosed)

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse
