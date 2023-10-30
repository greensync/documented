```mermaid
sequenceDiagram;
  Start->>Place: initialize
  Place->>Animal: initialize
  Animal->>Cat: meow
  Cat->>Animal: talk
  Animal->>Cat: meow
  Cat->>Animal: initialize
  Animal->>Dog: bark
  Dog->>Animal: talk
  Animal->>Dog: bark
  Dog->>Cat: is_friendly
````
