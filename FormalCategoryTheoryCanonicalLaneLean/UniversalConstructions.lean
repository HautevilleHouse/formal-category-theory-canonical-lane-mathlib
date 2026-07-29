import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure UniversalConstructionPackage where
  product : Prop
  coproduct : Prop
  equalizer : Prop
  coequalizer : Prop
  pullback : Prop
  pushout : Prop

structure UniversalConstructionEvidence (U : UniversalConstructionPackage) where
  productClosed : U.product
  coproductClosed : U.coproduct
  equalizerClosed : U.equalizer
  coequalizerClosed : U.coequalizer
  pullbackClosed : U.pullback
  pushoutClosed : U.pushout

def UniversalConstructionClosed (U : UniversalConstructionPackage) : Prop :=
  U.product ∧ U.coproduct ∧ U.equalizer ∧ U.coequalizer ∧ U.pullback ∧ U.pushout

theorem universal_construction_closed_from_evidence (U : UniversalConstructionPackage) (E : UniversalConstructionEvidence U) : UniversalConstructionClosed U :=
  And.intro E.productClosed (And.intro E.coproductClosed (And.intro E.equalizerClosed (And.intro E.coequalizerClosed (And.intro E.pullbackClosed E.pushoutClosed))))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse