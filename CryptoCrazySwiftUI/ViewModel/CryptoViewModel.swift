//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Hüseyin Özen Albayrak on 8.09.2023.
//

import Foundation

@MainActor
class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    let webservice = Webservice()
    
    /*
    func downloadCryptosAsync(url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        } catch {
            print(error)
        }
    }
    */
    
    func downloadCryotosContinuation(url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesContinuation(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            /*
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
             */
        } catch {
            print(error)
        }
    }
    
    /*
    func downloadCryptos(url: URL) {
        self.webservice.downloadCurrencies(url: url) { result in
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let cryptos):
                if let crypto = cryptos {
                    DispatchQueue.main.async {
                        //Bir yapıyı başka bir yapıya çevirmek için .map diye bir fonksiyonu kullanıyoruz
                        //Bu birçok programlama dilinde vardır. Tabi ki benzer ise çevirebiliriz.
                        self.cryptoList = crypto.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
     */
}

//burada tek yapacağım şey modeli alıp burada işlemek
struct CryptoViewModel {
    let crypto: CryptoCurrency
    
    var id: UUID? {
        crypto.id
    }
    var currency: String {
        crypto.currency
    }
    var price: String {
        crypto.price
    }
}
