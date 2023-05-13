//
//  MyCardView.swift
//  bletest
//
//  Created by Ye Eun Choi on 2023/05/08.
//

import SwiftUI


struct MyCardView: View {
    
    @State var isMine: Bool = true
    @State var QRAnimation: Bool = false
    @Binding var isQRCodePresented: Bool
    
    @State private var blinkingAnimation = false
    
    // MARK: - 내 유저 정보 dummy 인스턴스
    let myInfo: UserInfo = UserInfo(id: "", nickKorean: "리앤", nickEnglish: "Lianne", isSessionMorning: true, selfDescription: "다재다능한 디발자가 꿈⭐️🐠🐶 개자이너 아니고 디발자요!", cardColor: "mainPurple")
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 40)
                
                // MARK: - 내 명함으로 이동하는 단일 카드 뷰
                CardTemplate(isMine: $isMine, isQRCodePresented: $isQRCodePresented, QRAnimation: $QRAnimation, userInfo: myInfo)
                    .padding(.bottom, 34)
                
                // MARK: - 스와이프 안내 문구
                if !isQRCodePresented{
                    HStack {
                        Text("명함을 Swipe 해서 뒷면을 볼 수 있어요! →")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .opacity(blinkingAnimation ? 1.0 : 0.0)
                            .animation(Animation.easeIn(duration: 1).repeatForever(autoreverses: true))
                            .onAppear {
                                withAnimation {
                                    blinkingAnimation = true
                                }
                            }
                        Spacer()
                    }
                }
            }
            .padding(.top, -39)
            
            if isQRCodePresented{
                // MARK: - QR코드 뷰
                QRCodeGenerateView(isQRCodePresented: $isQRCodePresented, QRAnimation: $QRAnimation)
            }
        }
    }
}


//
//struct MyCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCardView()
//    }
//}
