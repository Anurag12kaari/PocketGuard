import SwiftUI

struct Recents: View {
    @AppStorage ("userName") private var userName: String = ""
    var body: some View {
        GeometryReader{
            let size = $0.size
            NavigationStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders] ){
                        Section{
                            Text("Recent")
                        } header:{
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
    @ViewBuilder
   func HeaderView(_ size: CGSize) -> some View {
        HStack(spacing:10){
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome!")
                    .font(.title.bold())
                if userName.isEmpty {
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            .visualEffect{content,GeometryProxy in
                content
                    .scaleEffect(headerScale(size,proxy: GeometryProxy),anchor: .leading)
            }
            Spacer(minLength: 0)
                NavigationLink{
                }label: {
                    Image(systemName: "plus")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 45, height:  45)
                        .background(appInt.gradient,in: .circle)
                        .contentShape(.circle)
                }
        }

        .padding(.bottom, userName.isEmpty ? 10 : 5)
        .background{
            VStack(spacing:0){
                Rectangle()
                    .fill(.white)
                Divider()
            }
            .visualEffect {content,GeometryProxy in
                content
                    .opacity(headerBGOpacity(GeometryProxy))
            }
                .padding(.top, -(safeArea.top + 15))
                .padding(.horizontal, -15)
            }
    }
    func headerBGOpacity(_ proxy:GeometryProxy)->CGFloat
    {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top

        return minY>0 ? 0 : (-minY/15)
    }
    func headerScale(_ size: CGSize,proxy: GeometryProxy) -> CGFloat{
        let minY = proxy.frame(in: .scrollView).minY
        let screenheight = size.height
        let progress = minY/screenheight
        let scale = min(max(progress,0),1) * 0.3
        return scale + 1
    }
}

#Preview {
    ContentView()
}
