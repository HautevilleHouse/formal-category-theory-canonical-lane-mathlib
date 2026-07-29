import FormalCategoryTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure LimitColimitPackage where
  category : Type u
  limitExists : Prop
  colimitExists : Prop
  limitUniversalProperty : Prop
  colimitUniversalProperty : Prop

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.limitUniversalProperty ∧ L.colimitUniversalProperty

theorem limits_colimits_bridge (L : LimitColimitPackage) : LimitColimitClosed L := by
  exact And.intro L.limitExists (And.intro L.colimitExists (And.intro L.limitUniversalProperty L.colimitUniversalProperty))

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse
