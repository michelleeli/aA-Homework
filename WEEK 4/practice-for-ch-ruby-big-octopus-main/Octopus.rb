# Big O-ctopus And Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ```sh
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#  'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# ```

# ## Sluggish Octopus

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to
# all other fish lengths

def sluggishOctopus
    fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh']
    longest = nil

    fish.each_with_index do |fish1, idx|
        fish.each_with_index do |fish2, idx2|
            if idx < idx2 && fish1.length > fish2.length 
                longest = fish1.length 
            else 
                longest = fish2 
            end 
        end 
    end 

    p longest
end 

## Dominant Octopus

# Find the longest fish in O(n log n) time. **Hint:** You saw a sorting algorithm
# that runs in O(n log n) in the [sorting complexity demo][sorting-demo] from the
# Sorting Complexity reading. Remember that Big O is classified by the dominant
# term.

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']

def dominantOctopus(array)

    middle = array.length / 2 
    left = array.take(middle)
    right = array.drop(middle)

    return array if array.length == 1 

    sorted = merge(dominantOctopus(left), dominantOctopus(right))
end 

def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            sorted << left.shift
        else 
            sorted << right.shift
        end 
    end 
    sorted + left + right
end 

p dominantOctopus(fish)[-1]


## Clever Octopus

# Find the longest fish in O(n) time. The octopus can hold on to the longest fish
# that you have found so far while stepping through the array only once.

def cleverOctopus 
    longest = ""
    fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']
    fish.each do |f|
        if f.length > longest.length
            longest = f 
        end 
    end 
    longest
end 

p cleverOctopus

## Dancing Octopus

# Full of fish, the Octopus attempts [Dance Dance Revolution][ddr]. The game has
# tiles in the following directions:

# ```ruby
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]
# ```

# To play the game, the octopus must step on a tile with her corresponding
# tentacle. You can assume that the octopus's eight tentacles are numbered and
# correspond to the tile direction indices.

# ## Slow Dance

# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(direction, array)
    array.each_with_index do |dir, idx|
        if dir == direction
            return idx
        end 
    end 
end 

# ```sh
p slow_dance("up", tiles_array)
# > 0

p slow_dance("right-down", tiles_array)
# > 3
# ```

# ## Fast Dance!

# Now that the octopus is warmed up, let's help her dance faster. Use a different
# data structure and write a new function so that you can access the tentacle
# number in O(1) time.

# ```sh
# fast_dance("up", new_tiles_data_structure)
# > 0

# fast_dance("right-down", new_tiles_data_structure)
# > 3
# ```