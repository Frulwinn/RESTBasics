import UIKit

class PersonSearchTableViewController: UITableViewController, UISearchBarDelegate {
    let personController = PersonController()
    var people = [Person]() 
    
    //outlet searchbar
    
    //implement uisearch bar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
