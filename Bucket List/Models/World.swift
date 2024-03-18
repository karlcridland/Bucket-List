//
//  World.swift
//  Bucket List
//
//  Created by Karl Cridland on 18/03/2024.
//

import Foundation

let all: [String: [String]] = [
    "Africa": [
        "Algeria", "Angola", "Benin", "Botswana", "Burundi", "Burkina Faso", "Cameroon",
        "Central African Republic", "Democratic Republic of the Congo", "Republic of Congo",
        "Côte d'Ivoire", "Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Ethiopia",
        "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Kenya", "Lesotho", "Liberia",
        "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mozambique", "Morocco", "Namibia",
        "Niger", "Nigeria", "Rwanda", "Senegal", "Sierra Leone", "Somalia", "South Africa", "South Sudan",
        "Sudan", "Swaziland", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe"
    ],
    "Asia": [
        "Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei Darussalam",
        "Cambodia", "China", "Georgia", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan",
        "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Lao PDR", "Lebanon", "Malaysia", "Maldives",
        "Mongolia", "Myanmar", "Nepal", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines",
        "Qatar", "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Syria", "Tajikistan", "Thailand",
        "Timor-Leste", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Vietnam", "Yemen"
    ],
    "Europe": [
        "Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia and Herzegovina", "Bulgaria",
        "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany",
        "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kosovo", "Latvia", "Liechtenstein",
        "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands",
        "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia",
        "Spain", "Sweden", "Switzerland", "Ukraine", "United Kingdom", "Vatican City"
    ],
    "North America": [
        "Antigua and Barbuda", "Bahamas", "Barbados", "Belize", "Canada", "Costa Rica", "Cuba",
        "Dominica", "Dominican Republic", "El Salvador", "Grenada", "Guatemala", "Haiti", "Honduras",
        "Jamaica", "Mexico", "Nicaragua", "Panama", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines",
        "Trinidad and Tobago", "United States"
    ],
    "Oceania": [
        "Australia", "Fiji", "Kiribati", "Marshall Islands", "Micronesia", "Nauru", "New Zealand",
        "Palau", "Papua New Guinea", "Samoa", "Solomon Islands", "Tonga", "Tuvalu", "Vanuatu"
    ],
    "South America": [
        "Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador", "Guyana", "Paraguay",
        "Peru", "Suriname", "Uruguay", "Venezuela"
    ]
]


class World: WorldViewModel {
    
    internal static var areContinentsSet: Bool = false

    internal static var continents: [ContinentVal: Continent] = [:]
    
    internal static func setContinents(){
        all.forEach { (continent: String, countries: [String]) in
            var newCountries: [Country] = []
            let newContinent = Continent(continent)
            countries.forEach { country in
                let newCountry = Country(country)
                newCountries.append(newCountry)
            }
            newContinent.setCountries(newCountries)
            if let val = ContinentVal(rawValue: continent.replacingOccurrences(of: " ", with: "")){
                World.continents[val] = (newContinent)
            }
        }
    }
    
    public static func getContinent(_ continent: ContinentVal) -> Continent? {
        if (!self.areContinentsSet) {
            self.setContinents()
            self.areContinentsSet = true
        }
        if let c = self.continents[continent]{
            return c
        }
        return nil
    }
    
    public static func allCountries() -> [Country]{
        var countries: [Country] = []
        let continents: [ContinentVal] = [.Europe, .NorthAmerica, .SouthAmerica, .Africa, .Asia, .Oceania, .Antartica]
        continents.forEach { c in
            self.getContinent(c)?.countries.forEach({ country in
                countries.append(country)
            })
        }
        return countries
    }
    
}

enum ContinentVal: String{
    case Europe
    case NorthAmerica
    case SouthAmerica
    case Africa
    case Asia
    case Oceania
    case Antartica
}
