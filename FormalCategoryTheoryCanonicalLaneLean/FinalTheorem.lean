import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

def ConstrainedCategoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_endgame (A : AdmissibleClass) : ConstrainedCategoryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse