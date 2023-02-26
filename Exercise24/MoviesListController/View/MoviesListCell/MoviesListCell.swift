//
//  MoviesListCell.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import UIKit

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var moviesImg: UIImageView!
    
    @IBOutlet weak var moviesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: MovieViewModel) {
        moviesLbl.text = item.title
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image)")!)) {
            (data, response,error) in
            
            do{
                var datas = try data
                DispatchQueue.main.async {
                    self.moviesImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    
    
}
