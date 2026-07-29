import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure MonoidalCategoryPackage where
  tensorProduct : Type u → Type u → Type u
  unitObject : Type u
  associatorIso : Prop
  leftUnitorIso : Prop
  rightUnitorIso : Prop
  pentagonEquation : Prop
  triangleEquation : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorIsoClosed : M.associatorIso
  leftUnitorIsoClosed : M.leftUnitorIso
  rightUnitorIsoClosed : M.rightUnitorIso
  pentagonEquationClosed : M.pentagonEquation
  triangleEquationClosed : M.triangleEquation

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associatorIso ∧ M.leftUnitorIso ∧ M.rightUnitorIso ∧
  M.pentagonEquation ∧ M.triangleEquation

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorIsoClosed
    (And.intro E.leftUnitorIsoClosed
      (And.intro E.rightUnitorIsoClosed
        (And.intro E.pentagonEquationClosed E.triangleEquationClosed)))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse