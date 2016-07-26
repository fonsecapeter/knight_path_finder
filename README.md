# Knight Path Finder :horse:

Ever wonder how to move a knight around a chess board? The `KnightPathFinder` class will simulate a real life knight chess piece and provide the moves necessary to get it to any position on the board. This exercise utilizes the Poly Tree Node data structure from my [ruby data structures repo](https://github.com/fonsecapeter/ruby_data_structures).


To use it, first clone the repo
```bash
git clone https://github.com/fonsecapeter/knight_path_finder.git
```
Then instantiate the class with a starting position
```ruby
kpf = KnightPathFinder.new([0, 0])
```

Finally, start asking for paths to new positions
```ruby
kpf.find_path([1, 1])
```
```ruby
=> [[0, 0], [2, 1], [0, 2], [2, 3], [1, 1]]
```

Tired of that position? Change it up
```ruby
kpf.starting_pos = [1, 1]
pry(main)> kpf.find_path([1, 2])
```
```ruby
=> [[1, 1], [0, 3], [2, 4], [1, 2]]
```

The `KnightPathFinder` will keep track of all possible moves. If you want to check it out, take a look at it's move tree root node. This is where it will perform a breadth-first-search to find the shortest path (a twist on the traveling salesman problem).
```ruby
puts(kpf.send(:root_node).to_s)
```
```ruby
[1, 1]
├── [3, 0]
|   ├── [2, 2]
|   |   ├── [0, 1]
|   |   ├── [1, 0]
|   |   ├── [4, 1]
|   |   |   ├── [6, 0]
|   |   |   ├── [3, 3]
|   |   |   └── [6, 2]
|   |   ├── [1, 4]
|   |   |   ├── [0, 6]
|   |   |   └── [2, 6]
|   |   ├── [4, 3]
|   |   |   ├── [6, 4]
|   |   |   |   └── [7, 6]
|   |   |   └── [5, 5]
|   |   |       └── [6, 7]
|   |   └── [3, 4]
|   |       └── [4, 6]
|   ├── [5, 1]
|   |   ├── [7, 0]
|   |   ├── [7, 2]
|   |   └── [6, 3]
|   |       ├── [7, 1]
|   |       └── [7, 5]
|   └── [4, 2]
|       ├── [2, 1]
|       |   └── [0, 0]
|       ├── [5, 0]
|       ├── [6, 1]
|       |   └── [7, 3]
|       └── [5, 4]
|           └── [6, 6]
├── [0, 3]
|   ├── [2, 4]
|   |   ├── [1, 2]
|   |   ├── [0, 5]
|   |   |   └── [1, 7]
|   |   ├── [1, 6]
|   |   |   └── [3, 7]
|   |   ├── [4, 5]
|   |   |   └── [5, 7]
|   |   └── [3, 6]
|   └── [1, 5]
|       ├── [0, 7]
|       └── [2, 7]
├── [3, 2]
|   ├── [2, 0]
|   ├── [1, 3]
|   |   └── [2, 5]
|   ├── [4, 0]
|   |   └── [5, 2]
|   ├── [5, 3]
|   |   ├── [7, 4]
|   |   └── [6, 5]
|   |       └── [7, 7]
|   └── [4, 4]
|       └── [5, 6]
└── [2, 3]
├── [0, 2]
├── [0, 4]
├── [3, 1]
└── [3, 5]
└── [4, 7]
```
