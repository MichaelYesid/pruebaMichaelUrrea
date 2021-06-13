//
//  Parser.swift
//  pruebaMichaelUrrea
//
//  Created by Michaelu on 13/06/21.
//

import Foundation

struct Parser {
    func parse(textFind: String, comp : @escaping ([LF])->()){
        let api = URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="+textFind)
        
        URLSession.shared.dataTask(with: api!){
            data, respose, error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode([AcronElement].self, from: data!)
                comp(result[0].lfs)
//                print(result)
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
