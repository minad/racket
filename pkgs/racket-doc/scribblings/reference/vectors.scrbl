#lang scribble/doc
@(require "mz.rkt")

@title[#:tag "vectors"]{Vectors}

@guideintro["vectors"]{vectors}

A @deftech{vector} is a fixed-length array with constant-time access
and update of the vector slots, which are numbered from @racket[0] to
one less than the number of slots in the vector.

Two vectors are @racket[equal?] if they have the same length, and if
the values in corresponding slots of the vectors are
@racket[equal?].

A vector can be @defterm{mutable} or @defterm{immutable}. When an
immutable vector is provided to a procedure like @racket[vector-set!],
the @exnraise[exn:fail:contract]. Vectors generated by the default
reader (see @secref["parse-string"]) are immutable.

A vector can be used as a single-valued sequence (see
@secref["sequences"]). The elements of the vector serve as elements
of the sequence. See also @racket[in-vector].

A literal or printed vector starts with @litchar{#(}, optionally with
a number between the @litchar{#} and
@litchar{(}. @see-read-print["vector" #:print "vectors"]{vectors}

@defproc[(vector? [v any/c]) boolean?]{

Returns @racket[#t] if @racket[v] is a vector, @racket[#f] otherwise.}


@defproc[(make-vector [size exact-nonnegative-integer?]
                      [v any/c 0]) vector?]{

Returns a mutable vector with @racket[size] slots, where all slots are
initialized to contain @racket[v].}


@defproc[(vector [v any/c] ...) vector?]{

Returns a newly allocated mutable vector with as many slots as provided @racket[v]s,
where the slots are initialized to contain the given @racket[v]s in
order.}


@defproc[(vector-immutable [v any/c] ...) (and/c vector?
                                                 immutable?)]{

Returns a newly allocated immutable vector with as many slots as provided
@racket[v]s, where the slots are contain the given @racket[v]s in
order.}



@defproc[(vector-length [vec vector?]) exact-nonnegative-integer?]{

Returns the length of @racket[vec] (i.e., the number of slots in the
vector).}

@defproc[(vector-ref [vec vector?] [pos exact-nonnegative-integer?]) any/c]{

Returns the element in slot @racket[pos] of @racket[vec]. The first
slot is position @racket[0], and the last slot is one less than
@racket[(vector-length vec)].}

@defproc[(vector-set! [vec (and/c vector? (not/c immutable?))]
                      [pos exact-nonnegative-integer?]
                      [v any/c])
         void?]{

Updates the slot @racket[pos] of @racket[vec] to contain @racket[v].}

@defproc[(vector-cas! [vec (and/c vector? (not/c immutable?))]
                      [pos exact-nonnegative-integer?]
                      [v any/c]
                      [v any/c])
         boolean?]{

Compare and set operation for vectors. See @racket[box-cas!].

@history[#:added "6.11.0.2"]
}

@defproc[(vector->list [vec vector?]) list?]{

Returns a list with the same length and elements as @racket[vec].}


@defproc[(list->vector [lst list?]) vector?]{

Returns a mutable vector with the same length and elements as
@racket[lst].}


@defproc[(vector->immutable-vector [vec vector?])
         (and/c vector? immutable?)]{

Returns an immutable vector with the same length and elements as @racket[vec].
If @racket[vec] is itself immutable, then it is returned as the result.}


@defproc[(vector-fill! [vec (and/c vector? (not/c immutable?))]
                       [v any/c])
         void?]{

Changes all slots of @racket[vec] to contain @racket[v].}


@defproc[(vector-copy! [dest (and/c vector? (not/c immutable?))]
                       [dest-start exact-nonnegative-integer?]
                       [src vector?]
                       [src-start exact-nonnegative-integer? 0]
                       [src-end exact-nonnegative-integer? (vector-length src)])
         void?]{

 Changes the elements of @racket[dest] starting at position
 @racket[dest-start] to match the elements in @racket[src] from
 @racket[src-start] (inclusive) to @racket[src-end] (exclusive). The
 vectors @racket[dest] and @racket[src] can be the same vector, and in
 that case the destination region can overlap with the source region;
 the destination elements after the copy match the source elements
 from before the copy. If any of @racket[dest-start],
 @racket[src-start], or @racket[src-end] are out of range (taking into
 account the sizes of the vectors and the source and destination
 regions), the @exnraise[exn:fail:contract].

@examples[(define v (vector 'A 'p 'p 'l 'e))
          (vector-copy! v 4 #(y))
          (vector-copy! v 0 v 3 4)
          v]}


@defproc[(vector->values [vec vector?]
                         [start-pos exact-nonnegative-integer? 0]
                         [end-pos exact-nonnegative-integer? (vector-length vec)])
         any]{

Returns @math{@racket[end-pos] - @racket[start-pos]} values, which are
the elements of @racket[vec] from @racket[start-pos] (inclusive) to
@racket[end-pos] (exclusive). If @racket[start-pos] or
@racket[end-pos] are greater than @racket[(vector-length vec)], or if
@racket[end-pos] is less than @racket[start-pos], the
@exnraise[exn:fail:contract].}

@defproc[(build-vector [n exact-nonnegative-integer?]
                       [proc (exact-nonnegative-integer? . -> . any/c)])
         vector?]{

Creates a vector of @racket[n] elements by applying @racket[proc] to
the integers from @racket[0] to @racket[(sub1 n)] in order. If
@racket[_vec] is the resulting vector, then @racket[(vector-ref _vec
_i)] is the value produced by @racket[(proc _i)].

@examples[
(build-vector 5 add1)
]}

@; ----------------------------------------
@section{Additional Vector Functions}

@note-lib[racket/vector]
@(define vec-eval (make-base-eval))
@examples[#:hidden #:eval vec-eval
          (require racket/vector)]

@defproc[(vector-set*! [vec (and/c vector? (not/c immutable?))]
                       [pos exact-nonnegative-integer?]
                       [v any/c]
                       ...
                       ...)
         void?]{

Updates each slot @racket[pos] of @racket[vec] to contain each @racket[v].
The update takes place from the left so later updates overwrite earlier updates.}

@defproc[(vector-map [proc procedure?] [vec vector?] ...+)
         vector?]{

Applies @racket[proc] to the elements of the @racket[vec]s from the
 first elements to the last. The @racket[proc] argument must accept
 the same number of arguments as the number of supplied @racket[vec]s,
 and all @racket[vec]s must have the same number of elements.  The
 result is a fresh vector containing each result of @racket[proc] in
 order.

@mz-examples[#:eval vec-eval
(vector-map + #(1 2) #(3 4))]
}

@defproc[(vector-map! [proc procedure?] [vec (and/c vector? (not/c immutable?))] ...+)
         vector?]{

Like @racket[vector-map], but result of @racket[proc] is inserted into
 the first @racket[vec] at the index that the arguments to
 @racket[proc] were taken from. The result is the first @racket[vec].

@mz-examples[#:eval vec-eval
(define v (vector 1 2 3 4))
(vector-map! add1 v)
v
]}

@defproc[(vector-append [vec vector?] ...) vector?]{

Creates a fresh vector that contains all
of the elements of the given vectors in order.

@mz-examples[#:eval vec-eval
(vector-append #(1 2) #(3 4))]
}


@defproc[(vector-take [vec vector?] [pos exact-nonnegative-integer?]) vector?]{
Returns a fresh vector whose elements are the first @racket[pos] elements of
@racket[vec].  If @racket[vec] has fewer than
@racket[pos] elements, then the @exnraise[exn:fail:contract].

@mz-examples[#:eval vec-eval
 (vector-take #(1 2 3 4) 2)
]}

@defproc[(vector-take-right [vec vector?] [pos exact-nonnegative-integer?]) vector?]{
Returns a fresh vector whose elements are the last @racket[pos] elements of
@racket[vec].  If @racket[vec] has fewer than
@racket[pos] elements, then the @exnraise[exn:fail:contract].

@mz-examples[#:eval vec-eval
 (vector-take-right #(1 2 3 4) 2)
]}

@defproc[(vector-drop [vec vector?] [pos exact-nonnegative-integer?]) vector?]{
Returns a fresh vector whose elements are the elements of @racket[vec]
 after the first @racket[pos] elements.  If @racket[vec] has fewer
 than @racket[pos] elements, then the @exnraise[exn:fail:contract].

@mz-examples[#:eval vec-eval
 (vector-drop #(1 2 3 4) 2)
]}

@defproc[(vector-drop-right [vec vector?] [pos exact-nonnegative-integer?]) vector?]{
Returns a fresh vector whose elements are the elements of @racket[vec]
 before the first @racket[pos] elements.  If @racket[vec] has fewer
 than @racket[pos] elements, then the @exnraise[exn:fail:contract].

@mz-examples[#:eval vec-eval
 (vector-drop-right #(1 2 3 4) 2)
]}

@defproc[(vector-split-at [vec vector?] [pos exact-nonnegative-integer?])
         (values vector? vector?)]{
Returns the same result as

@racketblock[(values (vector-take vec pos) (vector-drop vec pos))]

except that it can be faster.

@mz-examples[#:eval vec-eval
 (vector-split-at #(1 2 3 4 5) 2)
]}

@defproc[(vector-split-at-right [vec vector?] [pos exact-nonnegative-integer?])
         (values vector? vector?)]{
Returns the same result as

@racketblock[(values (vector-take-right vec pos) (vector-drop-right vec pos))]

except that it can be faster.

@mz-examples[#:eval vec-eval
 (vector-split-at-right #(1 2 3 4 5) 2)
]}


@defproc[(vector-copy [vec vector?]
                      [start exact-nonnegative-integer? 0]
                      [end exact-nonnegative-integer? (vector-length v)])
         vector?]{

Creates a fresh vector of size @racket[(- end start)], with all of the
elements of @racket[vec] from @racket[start] (inclusive) to
@racket[end] (exclusive).

@mz-examples[#:eval vec-eval
 (vector-copy #(1 2 3 4))
 (vector-copy #(1 2 3 4) 3)
 (vector-copy #(1 2 3 4) 2 3)
]
}

@defproc[(vector-filter [pred procedure?] [vec vector?]) vector?]{
Returns a fresh vector with the elements of @racket[vec] for which
 @racket[pred] produces a true value. The @racket[pred] procedure is
 applied to each element from first to last.

@mz-examples[#:eval vec-eval
  (vector-filter even? #(1 2 3 4 5 6))
]}

@defproc[(vector-filter-not [pred procedure?] [vec vector?]) vector?]{

Like @racket[vector-filter], but the meaning of the @racket[pred] predicate
is reversed: the result is a vector of all items for which @racket[pred]
returns @racket[#f].

@mz-examples[#:eval vec-eval
  (vector-filter-not even? #(1 2 3 4 5 6))
]}


@defproc[(vector-count [proc procedure?] [vec vector?] ...+)
         exact-nonnegative-integer?]{

Returns the number of elements of the @racket[vec ...] (taken in
parallel) on which @racket[proc] does not evaluate to @racket[#f].

@mz-examples[#:eval vec-eval
(vector-count even? #(1 2 3 4 5))
(vector-count = #(1 2 3 4 5) #(5 4 3 2 1))]
}


@defproc[(vector-argmin [proc (-> any/c real?)] [vec vector?]) any/c]{

This returns the first element in the non-empty vector @racket[vec] that minimizes
the result of @racket[proc].

@mz-examples[#:eval vec-eval
(vector-argmin car #((3 pears) (1 banana) (2 apples)))
(vector-argmin car #((1 banana) (1 orange)))
]
}

@defproc[(vector-argmax [proc (-> any/c real?)] [vec vector?]) any/c]{

This returns the first element in the non-empty vector @racket[vec] that maximizes
the result of @racket[proc].

@mz-examples[#:eval vec-eval
(vector-argmax car #((3 pears) (1 banana) (2 apples)))
(vector-argmax car #((3 pears) (3 oranges)))
]
}


@defproc[(vector-member [v any/c] [vec vector?])
         (or/c natural-number/c #f)]{

Locates the first element of @racket[vec] that is @racket[equal?] to
 @racket[v]. If such an element exists, the index of that element in
 @racket[vec] is returned. Otherwise, the result is @racket[#f].

@mz-examples[#:eval vec-eval
(vector-member 2 (vector 1 2 3 4))
(vector-member 9 (vector 1 2 3 4))
]}


@defproc[(vector-memv [v any/c] [vec vector?])
         (or/c natural-number/c #f)]{

Like @racket[vector-member], but finds an element using @racket[eqv?].
@mz-examples[#:eval vec-eval
(vector-memv 2 (vector 1 2 3 4))
(vector-memv 9 (vector 1 2 3 4))
]}


@defproc[(vector-memq [v any/c] [vec vector?])
         (or/c natural-number/c #f)]{

Like @racket[vector-member], but finds an element using @racket[eq?].

@mz-examples[#:eval vec-eval
(vector-memq 2 (vector 1 2 3 4))
(vector-memq 9 (vector 1 2 3 4))
]}

@defproc[(vector-sort [vec vector?]
                      [less-than? (any/c any/c . -> . any/c)]
                      [start exact-nonnegative-integer? 0]
                      [end exact-nonnegative-integer? (vector-length vec)]
                      [#:key key (any/c . -> . any/c) (λ (x) x)]
                      [#:cache-keys? cache-keys? boolean? #f])
         vector?]{

 Like @racket[sort], but operates on vectors; a
 @emph{fresh} vector of length @racket[(- end start)] is
 returned containing the elements from indices
 @racket[start] (inclusive) through @racket[end] (exclusive)
 of @racket[vec], but in sorted order (i.e., @racket[vec] is
 not modified). This sort is stable (i.e., the order of ``equal''
 elements is preserved).

@mz-examples[#:eval vec-eval
(define v1 (vector 4 3 2 1))
(vector-sort v1 <)
v1
(define v2 (vector '(4) '(3) '(2) '(1)))
(vector-sort v2 < 1 3 #:key car)
v2]

@history[#:added "6.6.0.5"]{}
}

@defproc[(vector-sort! [vec (and/c vector? (not/c immutable?))]
                       [less-than? (any/c any/c . -> . any/c)]
                       [start exact-nonnegative-integer? 0]
                       [end exact-nonnegative-integer? (vector-length vec)]
                       [#:key key (any/c . -> . any/c) (λ (x) x)]
                       [#:cache-keys? cache-keys? boolean? #f])
         void?]{

 Like @racket[vector-sort], but @emph{updates} indices
 @racket[start] (inclusive) through @racket[end] (exclusive)
 of @racket[vec] by sorting them according to the @racket[less-than?]
 procedure.

@mz-examples[#:eval vec-eval
(define v1 (vector 4 3 2 1))
(vector-sort! v1 <)
v1
(define v2 (vector '(4) '(3) '(2) '(1)))
(vector-sort! v2 < 1 3 #:key car)
v2]

@history[#:added "6.6.0.5"]{}
}


@close-eval[vec-eval]
