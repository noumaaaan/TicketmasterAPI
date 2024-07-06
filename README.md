# TicketmasterAPI
Welcome to TicketmasterAPI! A multi-tab application utilising various aspects of the Ticketmaster API with various features integrated built purely in SwiftUI and available on Testflight. This repository is a work in progress. 

## Getting Started

This application utilises the Ticketmaster API working against many platforms including Ticketmaster, TicketWeb, Universe, FrontGate, Ticketmaster Resale (TMR) and more. 

> To get started, first signup to get your API key here:
https://developer.ticketmaster.com/products-and-docs/apis/getting-started/

You will then need to create `Ticketmaster -> Networking -> Config.swift`
```  
class Config {
    let APIKEY = "YOUR_API_KEY_HERE"
} 
```

## Features
- Built purely in SwiftUI conforming to MMVVM
- Navigation stack with paginated response where data is only loaded as needed
- Seperated logic for the Networking layer, utilising async/await
- Launchscreen
- Persisting selected country in `UserDefaults`
- Creation of custom, shared and reusable components
- Custom tab bar view
- Minimalist animation where appropriate 
- Takes into account [Apples Human Interface Guidlines]([/guides/content/editing-an-existing-page#modifying-front-matter](https://developer.apple.com/design/human-interface-guidelines))


## Walkthrough
<table>
    <tr>
        <th>Tab</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/8eb00d2f-34fa-4303-8c4c-4a6ffb2d9784"></td>
        <td><ul>
            <strong>Events</strong>
            <li>View all events </li>
            <li>Search for a specific event within a specified country or worldwide</li>
            <li>Sort the results by relevance, name asc/desc, date asc/desc</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue or attraction for the given event</li>
            <li>See event information and details</li>
        </ul></td>
    </tr>
        <tr>          
        <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/c9ae6f2a-1403-4649-bc77-5a8bd4c2e185"></td>
        <td><ul>
            <strong>Attractions</strong>
            <li>Discover all attractions</li>
            <li>Sort the results by relevance, name asc/desc or random</li>
            <li>Search for a specific attraction</li>
            <li>See attraction information and their social links</li>
        </ul></td>
    </tr>
        <tr>
        <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/bac6f1c0-75b7-4d0c-a8cc-e20776a64bd6"></td>
        <td><ul>
            <strong>Discover</strong>
            <li>Discover all possible event types </li>
            <li>Filter down a type to view all genres i.e. Sport -> Football</li>
            <li>View all events for a selected genre</li>
            <li>Sort the results by relevance, name asc/desc, date asc/desc</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue or attraction for the given event</li>
        </ul></td>
    </tr>
        <tr>
        <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/83ab5c21-d1e9-489d-b1ff-94c518cce2f1"></td>
        <td><ul>
            <strong>Venues</strong>
            <li>Discover all venues </li>
            <li>Sort the results by relevance, name asc/desc or random</li>
            <li>Search for a specific venue</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue information as well as map/location information</li>
        </ul></td>
    </tr>
</table>

<table>
  <caption>
    Some more features
  </caption>
  <tbody>
    <tr>
      <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/efa556b3-1979-4a21-8e30-6d3a8a9fa468"></td>
      <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/413135d1-bb77-40ec-8f61-2f5cc93a070b"></td>
      <td><img src="https://github.com/noumaaaan/TicketmasterAPI/assets/43879032/b83f9506-9c49-4a14-93d7-a45558e42c6e"></td>
    </tr>
  </tbody>
</table>


## TODO
- Unit and UI Testing
- Greater error handling
- Ability to save events/venues/attractions into a 'favourite' section using SwiftData
- Localise strings
- Walkthrough screen
- Magic numbers and cleanup
- Setup pipeline and automated testflight deployment
