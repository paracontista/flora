#lang htdp/bsl

(require 2htdp/image)

(define x 3)
(define y 4)
(define prefix "hello")
(define suffix "world")
(define underscore "_")
(define str "helloworld")
(define i 5)
(define cat (bitmap "assets/cat.png"))
(define sunny #true)
(define friday #false)

;; NOTE: In htdp/bsl Char is renamed to 1String.

;; Exercise 01
;; distance : Int -> Int -> Int
;; function which calculates distance of a point (x,y) relative to origin (0,0) in the cartesian plane.
(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))

;; Exercise 02
;; add-middle-char : String -> 1String -> String
;; function which appends an underscore between two strings.
(define (add-middle-char s s2)
  (string-append s underscore s2))

;; Exercise 03
;; add-char-at-index : String -> 1String -> Int -> String
;; function which appends a Char at a given index inside a String.
(define (add-char-at-index s c idx)
  (string-append (substring s 0 idx) c (substring s idx)))

;; Exercise 04
;; delete-char-at-index : String -> Int -> String
;; function which *removes* a character at given index inside a String.
(define (delete-char-at-index s idx)
  (string-append (substring s 0 (- idx 1)) (substring s idx)))

;; Exercise 05
;; draw-boat : Image?
;; function which displays a boat using primitives found in 2htdp/image.
(define draw-boat
  (overlay/xy (right-triangle 36 48 "solid" "Ghost White")
              -20 20
              (overlay/xy (rectangle 4 40 "solid" "Brown")
                          -20 40
                          (rotate 180 (wedge 36 180 "solid" "Saddle Brown")))))

;; Exercise 06
;; pixels : Image? -> Int
;; function which counts pixels in an image.
(define (pixels img)
  (* (image-width img) (image-height img)))

;; Exercise 07
;; go-to-the-mall? : Bool -> Boolean
;; Function which determines if is a good day to go to the mall based in the following condition:
;; "You go to the mall either if is not sunny OR if today is Friday."
(define go-to-the-mall?
  (or (not sunny) friday))

;; Exercise 08
;; tall-or-wide? : Image -> String
;; function to determine if an image is "tall" or "wide".
(define (tall-or-wide? img)
  (if (>= (image-height img) (image-width img)) "tall" "wide"))

;; Exercise 08.1
;; tall-wide-or-square? : Image -> String
;; function to determine if an image is "tall", "wide" or "square".
(define (tall-wide-or-square? img)
  (if (= (image-height img) (image-width img)) "square"
      (if (>= (image-height img) (image-width img)) "tall" "wide")))

;; Exercise 09
(define wiggle '())

;; Tests
(distance x y)
(distance 1 0)
(distance 0 1)
(add-middle-char prefix suffix)
(add-char-at-index str underscore i)
(delete-char-at-index str i)
draw-boat
(pixels cat)
go-to-the-mall?
(tall-or-wide? cat)
(tall-wide-or-square? (rectangle 20 20 "solid" "Violet Red"))
