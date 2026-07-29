import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure LeftKanExtensionPackage (C D E : Type u) [Category C] [Category D] [Category E] where
  F : C ⥤ D
  G : C ⥤ E
  Lan : D ⥤ E
  unit : G ⟶ F ⋙ Lan
  universalProperty : ∀ (H : D ⥤ E) (α : G ⟶ F ⋙ H), ∃! (β : Lan ⟶ H), (whiskerLeft F β) ∘ unit = α

def LeftKanExtensionClosed {C D E : Type u} [Category C] [Category D] [Category E] (A : AdmissibleClass) (P : LeftKanExtensionPackage C D E) : Prop :=
  Lan.IsLeftKanExtension P.F P.G

theorem left_kan_extension_closed {C D E : Type u} [Category C] [Category D] [Category E] (A : AdmissibleClass) (P : LeftKanExtensionPackage C D E) : LeftKanExtensionClosed A P :=
  P.universalProperty

structure RightKanExtensionPackage (C D E : Type u) [Category C] [Category D] [Category E] where
  F : C ⥤ D
  G : C ⥤ E
  Ran : D ⥤ E
  counit : Ran ⋙ F ⟶ G
  universalProperty : ∀ (H : D ⥤ E) (α : H ⋙ F ⟶ G), ∃! (β : H ⟶ Ran), counit ∘ (whiskerRight β F) = α

def RightKanExtensionClosed {C D E : Type u} [Category C] [Category D] [Category E] (A : AdmissibleClass) (P : RightKanExtensionPackage C D E) : Prop :=
  Ran.IsRightKanExtension P.F P.G

theorem right_kan_extension_closed {C D E : Type u} [Category C] [Category D] [Category E] (A : AdmissibleClass) (P : RightKanExtensionPackage C D E) : RightKanExtensionClosed A P :=
  P.universalProperty

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse