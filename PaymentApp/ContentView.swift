//
//  ContentView.swift
//  PaymentApp
//
//  Created by Medhi Louison on 09/12/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView{
                Group{
                    TabView{
                        ForEach(sampleCard, id: \.self){card in
                            CreditCardView(creditCard: card)
                                .padding(.bottom,50)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height:280)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
                }
                .padding(.horizontal,16)
                AddCreditCardView()
                    .padding(.bottom,16)
                Rectangle()
                    .fill(.regularMaterial)
                    .frame(height: 8)
                    .padding(.bottom,16)
                Group{
                    VStack(alignment: .leading, spacing:8, content: {
                        Text("Payement Methods")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        ForEach(sampleCard, id: \.self){card in
                            Button{
                                
                            }label: {
                                HStack(spacing: 8){
                                    Image(card.creditCardType.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                        .padding(6)
                                        .background(.ultraThinMaterial)
                                        .clipShape(.circle)
                                    Text("\(card.creditCardType.imageName.capitalized) \(card.cardNumber)")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                    Spacer()
                                    FontIcon.text(.awesome5Solid(code: .chevron_right),fontsize:16,color:.secondary)
                                }
                                
                            }
                            .foregroundStyle(.primary)
                            .padding(.horizontal,6)
                            .padding(.vertical,12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Divider()
                            
                        }
                        Button{
                            
                        }label:{
                            Text("+ Add a New Way to Pay")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.light)
                                .padding(6)
                                .cornerRadius(4)
                        }
                        .padding(.horizontal,8)
                        .background(.regularMaterial)
                        .clipShape(.capsule)
                        
                    })
                    .padding(.horizontal,24)
                    
                }
                .padding(.bottom,16)
                Rectangle()
                    .fill(.regularMaterial)
                    .frame(height: 8)
                    .padding(.bottom,16)
                
                Group{
                    VStack(alignment: .leading, spacing:8){
                        Text("Coupons")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Button{
                            
                        }label :{
                            HStack(spacing:12){
                                FontIcon.text(.awesome5Solid(code: .percent),fontsize:16)
                                Text("Coupons")
                                    .font(.headline)
                                    .fontWeight(.light)
                                Spacer()
                                Text("0")
                                FontIcon.text(.awesome5Solid(code: .chevron_right),fontsize:16, color:.secondary)
                                
                            }
                        }
                        .foregroundStyle(.primary)
                        .padding(.horizontal,6)
                        .padding(.vertical,12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                        Button{
                            
                        }label:{
                            HStack(spacing:12){
                                FontIcon.text(.awesome5Solid(code: .plus),fontsize:16)
                                Text("Add the coupon code")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                Spacer()
                                FontIcon.text(.awesome5Solid(code: .chevron_right),fontsize:16, color:.secondary)
                            }
                        }
                        .foregroundStyle(.primary)
                        .padding(.horizontal,6)
                        .padding(.vertical,12)
                        .frame(maxWidth:.infinity, alignment:.leading)
                    }
                    .foregroundStyle(.primary)
                    .padding(.horizontal,24)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct ActionCreditCardButtonView: View{
    let icon: FontAwesomeCode
    var body: some View{
        FontIcon.button(.awesome5Solid(code: icon), action: {},fontsize: 12)
            .padding(8)
            .background(.ultraThinMaterial)
            .clipShape(.circle)
        
    }
}

struct CreditCardView : View {
    let creditCard: CreditCard
    
    var body: some View{
        VStack (alignment: .leading, spacing: 16){
            HStack{
                Image(creditCard.creditCardType.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipped()
                Spacer()
                VStack{
                    HStack{
                        ActionCreditCardButtonView(icon: .pencil_alt)
                        ActionCreditCardButtonView(icon: .trash)
                    }
                    Text(creditCard.bankName)
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)
                    
                }
            }
            HStack{
                Spacer()
                Text(creditCard.cardNumber)
                    .font(.title)
                    .fontWeight(.regular)
                Spacer()
            }
            HStack(spacing:8){
                VStack(alignment: .leading){
                    Text("Place Holder Name")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)
                    Text(creditCard.cardHolderName)
                        .font(.headline)
                        .fontWeight(.regular)
                }
                Spacer()
                VStack(alignment: .leading, content: {
                    Text("Expire Date")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)
                    Text(creditCard.expirationDate)
                        .font(.headline)
                        .fontWeight(.regular)
                })
                
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(
            LinearGradient(gradient: creditCard.creditCardType.gradient, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.secondary.opacity(0.5), lineWidth: 1.5)
                )
        )
        .cornerRadius(16)
        .padding(.horizontal)
        .padding(.top,8)
    }
}

struct AddCreditCardView: View{
    var body: some View{
        Button{
            
        }label:{
            Text("+ Add Card")
                .foregroundStyle(.primary)
                .font(.title3)
                .fontWeight(.light)
                .padding(12)
                .cornerRadius(4)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.regularMaterial)
        .clipShape(.capsule)
        .padding(.horizontal,32)
    }
}
