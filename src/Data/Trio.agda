{-# OPTIONS --without-K --exact-split --safe #-}

module Data.Trio where

open import Level
open import Agda.Primitive public renaming ( _⊔_ to _umax_ )
open import Data.Product using (_,_) renaming (_×_ to _*_)
open import Data.Maybe.Base using (Maybe; just; nothing)
open import Data.Sum renaming
 ( _⊎_ to _+_
 ; swap to s-swap
 ; inj₁ to left
 ; inj₂ to right
 )

private
  variable
    lA lB lC : Level
    A A' : Set lA
    B B' : Set lB
    C C' : Set lC

-- dependent tiple - generalize Sigma to 3 types

record Sigma3 (A : Set lA) (B : (a : A) -> Set lB) (C : (a : A)(b : B a) -> Set lC) : Set (lA umax lB umax lC) where
  constructor
    _,_
  field
    fst3 : A
    snd3 : B fst3
    trd3 : C fst3 snd3

-- TODO trimap

-- Dependent Triple A -> (B a, C a)
-- generalize Pi to 3 types where second and third depends on the first
DepTrio1 : (A : Set lA) (B : A -> Set lB) (C : A -> Set lC) -> Set (lA umax lB umax lC)
DepTrio1 {lA} {lB} {lC} A B C = (a : A) -> B a -> C a

-- TODO zimap

-- Dependent Triple (A,B) -> C a b
-- generalize Pi to type where third arguments depends on first and second
DepTrio2 : (A : Set lA) (B : Set lB) (C : (a : A)(b : B) -> Set lC) -> Set (lA umax lB umax lC)
DepTrio2 {lA} {lB} {lC} A B C = (a : A) -> (b : B) -> C a b

-- TODO nimap

-- Dependent Triple
-- generalize Pi to 3 types where second depend on first and third depends on first and second
-- DepTrio1:  A -> (B a, C a) generalized to A -> Sigma(B a, C b a)
-- has the same signature as
-- DepTrio2: (A,B) -> C a b generalized to Sigma(A , B a) -> C b a
DepTrio : (A : Set lA) (B : A -> Set lB) (C : (a : A)(b : B a) -> Set lC) -> Set (lA umax lB umax lC)
DepTrio {lA} {lB} {lC} A B C = (a : A) -> (b : B a) -> C a b
