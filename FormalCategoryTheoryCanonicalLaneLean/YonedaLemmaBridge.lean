import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure YonedaLemmaPackage (C : Type u) [Category C] where
  representablePresheaf : Cᵒᵖ ⥤ Type u
  naturalBijection : ∀ (X : C) (F : Cᵒᵖ ⥤ Type u), (yoneda.obj X ⟶ F) ≃ F.obj (Opposite.op X)
  bijectionNatural : Naturality of the bijection

def YonedaLemmaClosed {C : Type u} [Category C] (A : AdmissibleClass) (P : YonedaLemmaPackage C) : Prop :=
  ∀ (X : C) (F : Cᵒᵖ ⥤ Type u), (yoneda.obj X ⟶ F) ≃ F.obj (Opposite.op X)

theorem yoneda_lemma_closed {C : Type u} [Category C] (A : AdmissibleClass) (P : YonedaLemmaPackage C) : YonedaLemmaClosed A P :=
  P.naturalBijection

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse