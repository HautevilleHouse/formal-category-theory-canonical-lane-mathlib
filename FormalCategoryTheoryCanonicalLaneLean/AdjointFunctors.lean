import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure AdjointFunctorsPackage where
  leftAdjointDefined : Prop
  rightAdjointDefined : Prop
  adjunctionUnit : Prop
  adjunctionCounit : Prop
  triangleIdentities : Prop

structure AdjointFunctorsEvidence (A : AdjointFunctorsPackage) where
  leftAdjointDefinedClosed : A.leftAdjointDefined
  rightAdjointDefinedClosed : A.rightAdjointDefined
  adjunctionUnitClosed : A.adjunctionUnit
  adjunctionCounitClosed : A.adjunctionCounit
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorsClosed (A : AdjointFunctorsPackage) : Prop :=
  A.leftAdjointDefined ∧ A.rightAdjointDefined ∧ A.adjunctionUnit ∧ A.adjunctionCounit ∧ A.triangleIdentities

theorem adjoint_functors_closed_from_evidence (A : AdjointFunctorsPackage) (E : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A :=
  And.intro E.leftAdjointDefinedClosed (And.intro E.rightAdjointDefinedClosed (And.intro E.adjunctionUnitClosed (And.intro E.adjunctionCounitClosed E.triangleIdentitiesClosed)))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse