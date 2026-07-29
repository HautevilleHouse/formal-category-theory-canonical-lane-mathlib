import FormalCategoryTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  adjunctionExists : Prop
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.adjunctionExists ∧ A.unitNatural ∧ A.counitNatural ∧ A.triangleIdentities

theorem adjoint_functor_bridge (A : AdjointFunctorPackage) : AdjointFunctorClosed A := by
  exact And.intro A.adjunctionExists (And.intro A.unitNatural (And.intro A.counitNatural A.triangleIdentities))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse
