```mermaid
sequenceDiagram;
  Place->>Place: initialize
  Place->>Cat: initialize
  Cat->>Cat: meow
  Cat->>Cat: talk
  Cat->>Cat: meow
  Cat->>Dog: initialize
  Dog->>Dog: bark
  Dog->>Dog: talk
  Dog->>Dog: bark
  Dog->>Cat: is_friendly
  Cat->>Cat: is_friendly
  Cat->>Cat: fall_in_love
  Cat->>Dog: fall_in_love
  Dog->>Dog: fall_in_love
  Dog->>Cat: meow
  Cat->>Cat: talk
  Cat->>Cat: meow
  Cat->>Dog: bark
  Dog->>Dog: talk
  Dog->>Dog: bark
  Dog->>Place: initialize
````
