import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure YonedaLemmaPackage where
  yonedaEmbedding : Prop
  yonedaLemma : Prop
  naturality : Prop
  representableFunctors : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaClosed : Y.yonedaLemma
  naturalityClosed : Y.naturality
  representableFunctorsClosed : Y.representableFunctors

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.yonedaLemma ∧ Y.naturality ∧ Y.representableFunctors

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y :=
  And.intro E.yonedaEmbeddingClosed (And.intro E.yonedaLemmaClosed (And.intro E.naturalityClosed E.representableFunctorsClosed))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse