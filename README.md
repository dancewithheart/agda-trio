# agda-trio

Encode in Agda some of the previous ideas:
* modular approach to Bifunctor/Profunctor hierarchy ([Haskell](https://github.com/lemastero/trifunctors/blob/master/src/Data/UnifyBifunctorProfunctor.hs), [Scala](https://github.com/lemastero/Triglav/tree/master/src/main/scala/Triglav/face2))
```mermaid
classDiagram
   RightFunctor~F[_,+_]~ <|-- Bifunctor~P[+_,+_]~
   RightFunctor <|-- Profunctor~P[-_,+_]~

  class RightFunctor {
    ) map(F[A], A => B): F[B]
  }
  class Profunctor {
    ) dimap(AA => A, B => BB): P[A,B] => P[AA,BB]
  }
  class Bifunctor {
    ) bimap(A => AA, B => BB): P[A,B] => P[AA,BB]
  }
```
* experiments with:
   * Zifunctor ([Idris](https://github.com/lemastero/Idris-Trifunctors/blob/main/src/Data/Verified/Zifunctor.idr), [Haskell](https://github.com/lemastero/trifunctors/blob/master/src/Data/Zifunctor.hs#L47-L75), [Scala](https://github.com/lemastero/trifunctors/blob/master/src/Data/Zifunctor.hs#L86-L110)),
   * Trifunctor ([Idris](https://github.com/lemastero/Idris-Trifunctors/blob/main/src/Data/Verified/Trifunctor.idr), [Scala](https://github.com/lemastero/Triglav/blob/master/src/main/scala/Triglav/face3/Trifunctor.scala)),
   * Nifunctor ([Idris](https://github.com/lemastero/Idris-Trifunctors/blob/main/src/Data/Verified/Fufunctor.idr), [Haskell](https://github.com/lemastero/trifunctors/blob/master/src/Data/Zifunctor.hs#L86-L110), [Scala](https://github.com/lemastero/Triglav/blob/master/src/main/scala/Triglav/face3/Fnfunctor.scala)) types
```mermaid
classDiagram
   LeftFunctor~F[_,+_,_]~ <|-- RightBifunctor~F[_,+_,+_]~
   RightFunctor~F[_,_,+_]~ <|-- RightBifunctor
   RightFunctor <|-- RightProfunctor~F[-_,_,+_]~ 
   FirstContravariant~F[-_,_,_]~ <|-- RightProfunctor
   LeftFunctor <|-- LeftProfunctor~F[-_,+_,_]~
   FirstContravariant <|-- LeftProfunctor
 
   RightBifunctor <|-- Zivariant~F[-_,+_,+_]~
   RightProfunctor <|-- Zivariant
   LeftProfunctor <|-- Zivariant

  class FirstContravariant {
    ) contramap(EE => E): F[E,A,R] => F[EE,A,R]
  }
  class RightFunctor {
    ) map(R => RR): F[E,A,R] => F[E,A,RR]
  }
  class LeftFunctor {
    ) mapLeft(A => AA): F[E,A,R] => F[E,AA,R]
  }
  class LeftProfunctor {
    ) dimapLeft(A => AA, EE => E: F[E,A,R] => F[EE,AA,R]
  }
  class RightProfunctor {
    ) dimap(EE => E, R => RR): F[E,A,R] => F[EE,A,RR]
  }
  class RightBifunctor {
    ) bimap(A => AA, R => RR): F[R,A,R] => F[R,AA,RR]
  }
  class Zivariant {
    ) zimap(AA => A, B => BB, C => CC): F[A,B,C] => F[AA,BB,CC]
  }
```
* dependent triplets (previously [encoded in Idris](https://github.com/lemastero/Idris-Trifunctors/blob/main/src/Data/Triple.idr))
```mermaid
flowchart TB
  PiSigma[Π a -> Σ B a , C a b]-->PI[Π a -> B a]
  PiSigma-->Sigma[Σ a , B a]
  PI --> Function[A=>B]
  PI --> Product[A * B]
  Sigma --> Product
  Sigma --> Sum[A + B]
```
more precisely
```mermaid
flowchart TB
  Pi3[Π Π Π a -> B a -> C a b]-->PI
  SigmaPi[Π Σ a, B a -> C a b]-->PI[Π a -> B a]
  PiSigma[Π a -> Σ B a , C a b]-->PI[Π a -> B a]
  PiSigma-->Sigma[Σ a , B a]
  Sigma3[Σ Σ Σ a, B a , C a b]-->Sigma
  PI --> Function[A=>B]
  PI --> Product[A * B]
  Sigma --> Product
  Sigma --> Sum[A + B]
```
* application to optics (previously [encoded in Scala](https://github.com/lemastero/Triglav/blob/master/src/main/scala/Triglav/optics/TrifunctorOptics.scala#L9-L37))


Similar work:
* Bruno Gavranović [bgavran/DependentOpticsIdris2](https://github.com/bgavran/DependentOpticsIdris2/blob/main/src/DependentOptics.idr)
* Michael Snoyman [snoyberg/trio](https://github.com/snoyberg/trio)
* possibly related: [ajrouvoet/ternary.agda](https://github.com/ajrouvoet/ternary.agda)
