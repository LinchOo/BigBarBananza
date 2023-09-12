//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import EffectsLibrary


struct DiscontView: View {
    
    @State var userPoints = 50
    @State var isAlertPresented: Bool = false
    @State private var isShowInfo: Bool = false
    @State private var category: String = ""
    @State private var isSubmit: Bool = false
    @State private var isAlert: Bool = false
    @State private var orientation = UIDevice.current.orientation
    @State private var name = ""
    @State private var phone = ""
    
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State private var animationFlag = false
    
    @State var promoCode: String = ""
    var configParticle = ConfettiConfig(intensity: .low)
    
    var body: some View {
        Group
        {
            if orientation.isLandscape {
                landscapeOrientation
            } else if orientation.isFlat {
                landscapeOrientation
            } else
            {
                portraitOrientation
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width,maxHeight: UIScreen.main.bounds.height)
        .detectOrientation($orientation)
        .sheet(isPresented: $isAlertPresented,onDismiss: onDismisAlert){
            VStack(alignment: .center){
                Text("Please type your info below and we will might to contact with you")
                    .multilineTextAlignment(.center)
                TextField("Enter your name", text: $name)
                    .background(.white)
                    .padding(.horizontal)
                TextField("Enter your phone number",text: $phone)
                    .background(.white)
                    .padding(.horizontal)
                if !name.isEmpty && !phone.isEmpty
                {
                    Button{
                        isSubmit.toggle()
                    }label: {
                        Text("Submit")
                    }
                }
                if isSubmit == true {
                    Text("We will contact with you soon")
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowInfo) {
            LincensePurchaseInfoView(clouse: $isShowInfo)
        }
    }
    private var groupWindows: some View{
        VStack{
            headerSection
            redeemSection
        }
    }
    private var landscapeOrientation : some View {
        VStack{
            ZStack {
                VStack{
                    TabView{
                        groupWindows
                        //purchaseSection
                        qrSection
                            .offset(y: -50)
                            .frame(maxHeight: 200)
                    }
                    .tabViewStyle(.page)
                    Spacer()
                }
                .background{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 350,maxHeight: 350)
                        
                }
                if animationFlag{
                    winSection
                }
                    
            }
        }
    }
    private var portraitOrientation : some View {
        VStack{
            ZStack {
                VStack{
                    VStack{
                        headerSection
                        redeemSection
                            .padding(.top,30)
                            .padding(.horizontal)
                        //purchaseSection
                        qrSection
                            .padding(.bottom,70)
                            .frame(maxHeight: 300)
                    }
                    Spacer()
                }
                .background{
                    ZStack(alignment: .top){
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        Image("logo")
                            .resizable()
                            .frame(maxWidth: 120,maxHeight: 120)
                            .scaledToFit()
                    }
                }
                if animationFlag{
                    winSection
                }
            }
        }
    }
    func winAnimation(){
        animationFlag.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 5)){
                animationFlag.toggle()
            }
        }
        
    }
    
    func generateQR(text: String) -> Data? {
        let filter = CIFilter.qrCodeGenerator()
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else { return nil }
        filter.message = data
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

extension DiscontView {
    private var headerSection: some View {
        HStack(alignment: .center){
            VStack{
                Text("Hello, John")
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding()
            }
            Spacer()
            HStack{
                //Image("")
                Text("\(userPoints)")
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding()
            }
        }
    }
    
    private var redeemSection: some View{
        VStack(alignment: .center){
            Text("Redeem Promo Code")
            TextField("2ks1j-ad9i3-m6ci4", text: $promoCode)
                .frame(maxWidth: 250)
                .padding(.horizontal,55)
                .background(.white)
                .alert(isPresented: $isAlert) {
                    Alert(title: Text("Error"), message: Text("Wrong Promo Code"), dismissButton: .default(Text("Got it")))
                        }
            
            if !promoCode.isEmpty{
                Button{
                    if promoCode == "2ks1j-ad9i3-m6ci3"
                    {
                        userPoints += 50
                        promoCode = ""
                        winAnimation()
                    }else{
                        isAlert.toggle()
                        promoCode = ""
                    }
                } label: {
                    Text("Redeem")
                        .fontWeight(.black)

                        .padding(5)
                }
            }
        }
        .shadow(radius: 1)
        .padding()
        .padding(.horizontal, 25)
        .background(.ultraThinMaterial)
    }
    
    private var purchaseSection: some View {
        VStack{
            HStack(alignment: .center,spacing: 15){
                Text("License Purchase")
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                
                HStack{
                    Image(systemName: "info.circle")
                        //.background(Color.black.opacity(0.3))
                        .cornerRadius(45)
                        .padding(15)
                        .foregroundColor(.red)
                        .shadow(color: .white, radius: 0.5)
                        .onTapGesture {
                            isShowInfo.toggle()
                        }
                }
                .background(.ultraThinMaterial)
                .cornerRadius(45)
                
            }
            HStack(spacing: 10){
                Button{
//                    Task.init{
//                        try await store.purchase(store.products[0])
//                    }
//                    xTask.init{
//                        if let productOne = store.products.first(where: {$0.id == "License_Standart"}) {
//                            try await store.purchase(productOne)
//                        }
                }label: {
                    VStack(spacing:0) {
                        Image("Fish_S")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 100)
                            .scaledToFit()
                        Image("standart")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 25)
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.bottom,10)
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                }
                Button{
                    alertShow(cat: "Preamium")
                }label: {
                    VStack(spacing:0) {
                        Image("Fish_M")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 100)
                            .scaledToFit()
                        Image("premium")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 25)
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.bottom,10)
                        
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                }
                Button{
                    alertShow(cat: "Luxury")
                }label: {
                    VStack(spacing:0) {
                        Image("Fish_XL")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 100)
                            .scaledToFit()
                        Image("luxury")
                            .resizable()
                            .frame(maxWidth: 100,maxHeight: 25)
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.bottom,10)
                        
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                }
            }
            .padding(.horizontal)
        }
    }
    private func onDismisAlert(){
        name = ""
        phone = ""
        category = ""
        isSubmit = false
    }
    private func alertShow(cat: String){
        self.category = cat
        isAlertPresented.toggle()
    }
    private var qrSection: some View {
        VStack{
            Image(uiImage: UIImage(data: generateQR(text: "text")!)!)
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(25)
        }
        .shadow(radius: 1)
    }
    private var winSection: some View{
        ZStack{
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            VStack{
                Text("Congratulations 🎉🎉🎉")
                    .foregroundColor(.white)
                    .font(.custom("Scalter-Regular", size: 35))
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("You earn 50 Points")
                    .foregroundColor(.green)
                    .font(.title3)
                    .fontWeight(.black)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            FireworksView()
            ConfettiView(config: configParticle)
        }
    }
}


struct DiscontView_Previews: PreviewProvider {
    static var previews: some View {
        DiscontView()
            
    }
}
