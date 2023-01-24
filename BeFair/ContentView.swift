//
//  ContentView.swift
//  BeFair
//
//  Created by Wallace Soares on 23/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var salaryText: String = "Salario liquido da primeira pessoa"
    @State var salaryText2: String = "Salario liquido da segunda pessoa"
    @State var billText: String = "Valor da conta a dividir"
    @State var resultText1: String = "Quanto a primeira pessoa precisa pagar"
    @State var resultText2: String = "Quanto a segunda pessoa precisa pagar"
    @State var percentage1: Float = 0.0
    @State var percentage2: Float = 0.0
    @State var result1: Float = 0.0
    @State var result2: Float = 0.0
    @State var salary1: String = "8717.91"
    @State var salary2: String = "3764.69"
    @State var bill: String = ""
    
    func calculateDivision() {
        if Float64(salary1) == nil {
            salaryText = "Valor do salario 1 incorreto"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                salaryText = "Salario liquido da primeira pessoa"
            }
        }
        if Float32(salary2) == nil {
            salaryText2 = "Valor do salario 2 incorreto"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                salaryText2 = "Salario liquido da primeira pessoa"
            }
        }
        if Float32(bill) == nil {
             billText = "Valor da conta incorreto"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                billText = "Salario liquido da primeira pessoa"
            }
        }
        
        percentage1 = NSString(string: salary1).floatValue / (NSString(string: salary1).floatValue + NSString(string: salary2).floatValue)
        percentage2 = NSString(string: salary2).floatValue / (NSString(string: salary1).floatValue + NSString(string: salary2).floatValue)
        result1 = percentage1 * NSString(string: bill).floatValue.rounded()
        result2 = percentage2 * NSString(string: bill).floatValue
        
        resultText1 = String(format: "Primeira pessoa: %.2f", result1)
        resultText2 = String(format: "Segunda pessoa: %.2f", result2)
    }
    

    var body: some View {
        ZStack{
            Color.purple
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    VStack{
                        Text(salaryText)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        TextField("Primeiro salário", text: $salary1)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                    }
                    VStack {
                        Text(salaryText2)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        TextField("Segundo salário", text: $salary2)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                    }
                }
                TextField(billText, text: $bill)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(40)
                    .keyboardType(.decimalPad)
                Button(action: {calculateDivision()})
                {
                    Text("Calcular divisão")
                        .padding()
                        .cornerRadius(40)
                }.foregroundColor(.white).accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/).buttonBorderShape(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=shape: ButtonBorderShape@*/.capsule/*@END_MENU_TOKEN@*/)
                VStack {
                    Text(resultText1)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                    Text(resultText2)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                }
                .padding(.top, 15.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
