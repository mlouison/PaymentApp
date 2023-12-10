//
//  CreditCard.swift
//  PaymentApp
//
//  Created by Medhi Louison on 09/12/2023.
//

import Foundation

struct CreditCard : Hashable {
    let creditCardType : CreditCardType
    let bankName : String
    let cardNumber : String
    let cardHolderName : String
    let expirationDate : String
}

let sampleCard : [CreditCard] = [
    CreditCard(creditCardType: .visa, bankName: "Caisse d'épargne", cardNumber: "1234 1234 1234 1234", cardHolderName: "Medhi Louison", expirationDate:"10/2025"),
    CreditCard(creditCardType: .masterCard, bankName: "n26", cardNumber: "1234 1234 1234 1234", cardHolderName: "Medhi Louison", expirationDate: "05/2024"),
    CreditCard(creditCardType: .amex, bankName: "American Express", cardNumber: "1234 1234 1234 1234", cardHolderName: "Medhi Louison", expirationDate: "10/2025")
]
