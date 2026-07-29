import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure KanExtensionPackage where
  leftKanExtension : Type u → Type v
  rightKanExtension : Type u → Type v
  kanExtensionExists : Prop
  pointwiseFormula : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  leftKanExists : K.kanExtensionExists
  rightKanExists : K.kanExtensionExists
  pointwiseFormulaClosed : K.pointwiseFormula

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.kanExtensionExists ∧ K.pointwiseFormula

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage)
    (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.leftKanExists E.pointwiseFormulaClosed

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse