//
//  SafeVaultWidget.swift
//  SafeVaultWidget
//
//  Created by Ramiro Gonzalez on 22/10/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Model : TimelineEntry {
    var date : Date
    var widgetData : [Vault]
}

struct Provider : TimelineProvider {
    func getSnapshot(in context: Context, completion: @escaping (Model) -> Void) {
        
        // inital snapshot....
        // or loading type content....
        let loadingData = Model(date: Date(), widgetData: [Vault()])
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        
        // parsing json data and displaying....
        getData { (modelData) in
            let date = Date()
            let data = Model(date: date, widgetData: modelData)
            // creating Timeline...
            // reloading data every 15 minutes...
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: date)
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            completion(timeline)
        }
    }
    
    func placeholder(in context: Context) -> Model {
        // inital snapshot....
        // or loading type content....
        let loadingData = Model(date: Date(), widgetData: [Vault()])
        return loadingData
    }
    
}


struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct SafeVaultWidgetEntryView : View {
    var data : Model
    @Environment(\.widgetFamily) var family

    var body: some View {
        if family == .systemMedium {
            SafeVaultWidgetMedium(data: data)
        } else  {
            SafeVaultWidgetMedium(data: data)
        }
    }
}

struct SafeVaultWidgetMedium: View {
    var data : Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Watchlist")
                    .font(Font.footnote.smallCaps())
                    .foregroundColor(.secondary)
                Text("\(data.date, formatter: Self.taskDateFormat)")
                    .font(.caption2)
            }
            ForEach(data.widgetData) { item in
                VaultRow(
                    token: "\(item.collateral)-icon",
                    name: item.name,
                    liquidationPrice: item.liquidationPrice,
                    ratio: item.ratio,
                    liquidationRatio: item.liquidationRatio
                )
                .padding(.vertical, 1.0)
            }
        }
        .padding(12)
    }
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

@main
struct SafeVaultWidget: Widget {
    let kind: String = "SafeVaultWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { data in
            SafeVaultWidgetEntryView(data: data)
        }
        .configurationDisplayName("Safe Vaults")
        .description("Quick view vaults from your watchlist")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct SafeVaultWidget_Previews: PreviewProvider {
    static var previews: some View {
        SafeVaultWidgetEntryView(data: Model(date: Date(), widgetData: [Vault()]))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

func getData(completion: @escaping ([Vault])-> ()){
    var vaults: [Vault] = []
    
    let v1 = Vault()
    v1.name = "Vault #719"
    v1.collateral = "ETH"
    v1.number = 719
    v1.userAddress = "0x7d6149aD9A573A6E2Ca6eBf7D4897c1B766841B4"
    v1.liquidationPrice = 189.073
    v1.liquidationRatio = 150
    v1.ratio = 328.82
    v1.collateralAmount = 250000
    v1.debtAmount = 31512306.25
    v1.collateralPrice = 414.47
    
    let v2 = Vault()
    v2.name = "Vault #10931"
    v2.collateral = "WBTC"
    v2.number = 10931
    v2.userAddress = "0x4086E3e1e99a563989a9390faCff553A4f29b6eE"
    v2.liquidationPrice = 9961.19
    v2.liquidationRatio = 150
    v2.ratio = 196.06
    v2.collateralAmount = 5542.87727
    v2.debtAmount = 36809124.62
    v2.collateralPrice = 13020.39
    
    let v3 = Vault()
    v3.name = "Vault #12051"
    v3.collateral = "USDC"
    v3.number = 12051
    v3.userAddress = "0x8FFfcd4C45467144E37BE379DA3E794060C6Da9c"
    v3.liquidationPrice = 1.09
    v3.liquidationRatio = 110
    v3.ratio = 100.6
    v3.collateralAmount = 43667507.434327
    v3.debtAmount = 43368096.54
    v3.collateralPrice = 1
    
    
    
    vaults.append(v1)
    vaults.append(v2)
    vaults.append(v3)
    
    completion(vaults)

//    completion([Vault()])
//    let url = "https://canvasjs.com/data/gallery/javascript/daily-sales-data.json"
//    let session = URLSession(configuration: .default)
//    session.dataTask(with: URL(string: url)!) { (data, _, err) in
//        if err != nil{
//            print(err!.localizedDescription)
//            return
//        }
//        do{
//            let jsonData = try JSONDecoder().decode([JSONModel].self, from: data!)
//            completion(jsonData)
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//    }.resume()
}
