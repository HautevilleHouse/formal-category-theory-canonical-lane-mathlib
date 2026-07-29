import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure LimitPackage (C : Type u) [Category C] (J : Type v) [Category J] where
  diagram : J ⥤ C
  cone : Cone diagram
  universalProperty : ∀ (c : Cone diagram), ∃! (f : c.pt ⟶ cone.pt), ∀ (j : J), f ≫ cone.π.app j = c.π.app j

def LimitClosed {C : Type u} [Category C] {J : Type v} [Category J] (A : AdmissibleClass) (P : LimitPackage C J) : Prop :=
  IsLimit P.cone

theorem limit_closed {C : Type u} [Category C] {J : Type v} [Category J] (A : AdmissibleClass) (P : LimitPackage C J) : LimitClosed A P :=
  P.universalProperty

structure ColimitPackage (C : Type u) [Category C] (J : Type v) [Category J] where
  diagram : J ⥤ C
  cocone : Cocone diagram
  universalProperty : ∀ (c : Cocone diagram), ∃! (f : cocone.pt ⟶ c.pt), ∀ (j : J), cocone.ι.app j ≫ f = c.ι.app j

def ColimitClosed {C : Type u} [Category C] {J : Type v} [Category J] (A : AdmissibleClass) (P : ColimitPackage C J) : Prop :=
  IsColimit P.cocone

theorem colimit_closed {C : Type u} [Category C] {J : Type v} [Category J] (A : AdmissibleClass) (P : ColimitPackage C J) : ColimitClosed A P :=
  P.universalProperty

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse