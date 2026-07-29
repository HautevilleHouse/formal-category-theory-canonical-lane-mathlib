import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure LeftAdjoint {C D : Type u} [Category C] [Category D] (F : C ⥤ D) where
  rightAdj : D ⥤ C
  unit : 𝟭 C ⟶ rightAdj ⋙ F
  counit : F ⋙ rightAdj ⟶ 𝟭 D
  triangleLeft : (unit.app X).whiskerRight F ≫ (counit.app (F.obj X)) = 𝟙 (F.obj X)  := by aesop_cat
  triangleRight : (unit.app (rightAdj.obj Y)).whiskerRight rightAdj ≫ (rightAdj.map (counit.app Y)) = 𝟙 (rightAdj.obj Y) := by aesop_cat

structure RightAdjoint {C D : Type u} [Category C] [Category D] (G : D ⥤ C) where
  leftAdj : C ⥤ D
  unit : 𝟭 C ⟶ G ⋙ leftAdj
  counit : leftAdj ⋙ G ⟶ 𝟭 D
  triangleLeft : (unit.app X).whiskerRight G ≫ (leftAdj.map (counit.app X)) = 𝟙 (leftAdj.obj X) := by aesop_cat
  triangleRight : (unit.app (G.obj Y)).whiskerRight leftAdj ⋙ (G.map (counit.app Y)) = 𝟙 (G.obj Y) := by aesop_cat

structure AdjointFunctorPackage (C D : Type u) [Category C] [Category D] where
  functorDir : C ⥤ D
  functorInv : D ⥤ C
  adjunctionData : IsAdjointPair functorDir functorInv

def AdjointFunctorClosed {C D : Type u} [Category C] [Category D] (A : AdmissibleClass) (P : AdjointFunctorPackage C D) : Prop :=
  IsAdjointPair P.functorDir P.functorInv

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse