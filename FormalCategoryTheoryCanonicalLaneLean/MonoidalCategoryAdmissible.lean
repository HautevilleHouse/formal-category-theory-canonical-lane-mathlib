import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalCategoryTheoryCanonicalLaneLean

structure MonoidalCategoryPackage (C : Type u) [Category C] where
  tensorProduct : C → C → C
  unitObject : C
  associator : ∀ (X Y Z : C), (tensorProduct (tensorProduct X Y) Z) ≅ (tensorProduct X (tensorProduct Y Z))
  leftUnitor : ∀ (X : C), (tensorProduct unitObject X) ≅ X
  rightUnitor : ∀ (X : C), (tensorProduct X unitObject) ≅ X
  pentagonIdentity : ∀ (W X Y Z : C), ((associator W X Y).comp (associator (tensorProduct W X) Y Z)).hom ≫
    ((associator W (tensorProduct X Y) Z).hom) ≫
    ((tensorProduct W).map (associator X Y Z).hom) = ((associator (tensorProduct W X) Y Z).hom) ≫
    ((tensorProduct (associator W X Y).hom Z).hom)
  triangleIdentity : ∀ (X Y : C), ((rightUnitor X).comp (leftUnitor Y)).hom =
    ((tensorProduct X).map (leftUnitor Y).hom) ≫ (associator X unitObject Y).hom ≫ ((rightUnitor X).map (tensorProduct Y))

def MonoidalCategoryClosed {C : Type u} [Category C] (A : AdmissibleClass) (P : MonoidalCategoryPackage C) : Prop :=
  P.pentagonIdentity ∧ P.triangleIdentity

theorem monoidal_category_closed {C : Type u} [Category C] (A : AdmissibleClass) (P : MonoidalCategoryPackage C) : MonoidalCategoryClosed A P :=
  And.intro P.pentagonIdentity P.triangleIdentity

end FormalCategoryTheoryCanonicalLaneLean
end HautevilleHouse