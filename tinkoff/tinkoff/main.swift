import Foundation


if let a = readLine(){
    if let b = Int(a){
        if b%2 == 0{
            print(b/2)
        } else{
            print((b+1)/2)
        }
    }
}

