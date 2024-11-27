;; title: purcharse-token
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;
(define-public (purcharse-token) 
    (begin 
        ;; debiting to the contract
        (try! (stx-transfer? u100000 tx-sender (as-contract tx-sender))) 
        (contract-call? .safe-token mint-safe-token)
    )
)


;; read only functions
;;

;; private functions
;;
