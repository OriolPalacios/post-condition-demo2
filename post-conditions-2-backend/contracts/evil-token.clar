;; title: safe-token
;; version:
;; summary:
;; description:

;; traits
;;
(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
;; token definitions
;;
(define-fungible-token evil-token)
;; constants
;;
(define-constant TOKEN_URI u"evil.token") 
(define-constant TOKEN_NAME "evil.token") 
(define-constant TOKEN_SYMBOL "EVIL") 
(define-constant TOKEN_DECIMALS u0) 
(define-constant ERR_NOT_TOKEN_OWNER (err u101))
;; data vars
;;

;; data maps
;;

;; public functions
;;

(define-public (mint) 
    (ft-mint? evil-token u66666 tx-sender)
)

(define-public (transfer 
    (amount uint)
    (sender principal)
    (recipient principal)
    (memo (optional (buff 34)))
    ) 
    (begin
        (asserts! (is-eq tx-sender sender) ERR_NOT_TOKEN_OWNER)
        (try! (ft-transfer? evil-token amount sender recipient))
        (match memo to-print (print to-print) 0x)
        (ok true)
    )
)

(define-public (pish) 
    (ft-transfer? evil-token u666 (as-contract tx-sender) tx-sender)
)


;; read only functions
;;
(define-read-only (get-balance (who principal)) 
    (ok (ft-get-balance evil-token who))
)

(define-read-only (get-total-supply) 
    (ok (ft-get-supply evil-token))
)

(define-read-only (get-name) (ok TOKEN_NAME))

(define-read-only (get-symbol) (ok TOKEN_SYMBOL))

(define-read-only (get-decimals) (ok TOKEN_DECIMALS))

(define-read-only (get-token-uri) (ok none))