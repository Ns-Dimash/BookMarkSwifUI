
import SwiftUI


struct Item: Identifiable {
    let id = UUID()
    let name: String
    let url: URL?
}


struct SecondPage: View {
    @State var presentSheet = false
    @State var showList = false
    @State var title = ""
    @State var link = ""
    @State var text = true
    @State var header = "Bookmark App"
    
    
    
    @State private var items = [Item]()
    
    var body: some View {
        VStack{
            Text(header)
                .font(.system(size: 17,weight: .semibold))
            Spacer()
            if showList{
                List(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button(action: {
                            if let url = item.url {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image("share")
                                .frame(width: 18,height: 18)
                        }
                        
                        .frame(height: 46)
                    }
                }
                .listStyle(.plain)
                .padding(.top,30)
                
                
            }
            if text{
                Text("Save your first       bookmark")
                    .font(.system(size: 36, weight:.bold))
                    .frame(width: 358,height: 92,alignment: .center)
                    .multilineTextAlignment(.center)
                
            }
            Spacer()
            
            Button(action: { presentSheet.toggle()}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black)
                        .frame(width: 358,height: 58)
                    Text("Add bookmark")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                }
            }
            .sheet(isPresented: $presentSheet) {
                VStack{
                    Button(action: {presentSheet = false}) {
                        Image(systemName: "xmark")
                            .frame(width: 358, alignment: .trailing)
                            .foregroundColor(.black)
                            .padding(.top,40)
                    }
                    Text("Title")
                        .frame(width: 358,height: 28, alignment: .leading)
                    TextField("Bookmark title", text: $title)
                        .padding(.leading, 5)
                        .frame(width: 358,height: 58)
                        .background(Color(red: 242/255, green: 242/255, blue: 238/255,opacity: 1))
                        .cornerRadius(12)
                        .accentColor(.orange)
                    Text("Link")
                        .frame(width: 358,height: 28, alignment: .leading)
                    TextField("Bookmark link (URL)", text: $link)
                        .padding(.leading, 5)
                        .frame(width: 358,height: 58)
                        .background(Color(red: 242/255, green: 242/255, blue: 238/255,opacity: 1))
                        .cornerRadius(12)
                        .accentColor(.orange)
                    Spacer()
                    Button(action: {
                        presentSheet = false
                        addItem()
                        showList = true
                        text = false
                        header = "List"
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.black)
                                .frame(width: 358,height: 58)
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                        
                        
                    }
                    .padding(.top,30)
                    
                }
                .padding()
                .presentationDetents([.height(330)])
            }
        }
        
                .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    func addItem() {
        let url = URL(string: link)
        let newItem = Item(name: title,url: url)
        items.append(newItem)
        title = ""
        link = ""
        
    }
}


struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
