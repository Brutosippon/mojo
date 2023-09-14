array1 = [10, 5, 2, 3, 1, 8, 9, 7, 6,23,23,0, 5, 2, 3, 1, 8, 9, 7, 6,23,23,655,9,8,7,6,5,4,3,2,1,89,56,121,1454,10, 5, 2, 3, 1, 8, 9, 7, 6,23,23,0, 5, 2, 3, 1, 8, 9, 7, 6,23,23,655,9,8,7,6,5,4,3,2,1,89,56,121,1454,454]

def quicksort(array):
    if len(array) <= 1:
        return array
    
    pivot = array[len(array) // 2]
    less = [x for x in array if x < pivot]
    equal = [x for x in array if x == pivot]
    greater = [x for x in array if x > pivot]
    
    return quicksort(less) + equal + quicksort(greater)

print( quicksort(array1))


def binary_search(array, item):
    low = 0
    high = len(array) - 1
    while low <= high:
        mid = (low + high) // 2
        if array[mid] == item:
            return mid
        elif array[mid] < item:
            low = mid + 1
        else:
            high = mid - 1

    return -1

item = 5

index = binary_search(array, item)

if index == -1:
    print("Item not found")
else:
    print("Item found at index", index)



array1 = [10, 5, 2, 3, 1, 8, 9, 7, 6,23,23,0, 5, 2, 3, 1, 8, 9, 7, 6,23,23,655,9,8,7,6,5,4,3,2,1,89,56,121,1454,10, 5, 2, 3, 1, 8, 9, 7, 6,23,23,0, 5, 2, 3, 1, 8, 9, 7, 6,23,23,655,9,8,7,6,5,4,3,2,1,89,56,121,1454,454]

def quicksort(array):
    if len(array) <= 1:
        return array
    
    pivot = array[len(array) // 2]
    less = [x for x in array if x < pivot]
    equal = [x for x in array if x == pivot]
    greater = [x for x in array if x > pivot]
    
    return quicksort(less) + equal + quicksort(greater)

print( quicksort(array1))


def binary_search(array, item):
    low = 0
    high = len(array) - 1
    while low <= high:
        mid = (low + high) // 2
        if array[mid] == item:
            return mid
        elif array[mid] < item:
            low = mid + 1
        else:
            high = mid - 1

    return -1

item = 5

index = binary_search(array, item)

if index == -1:
    print("Item not found")
else:
    print("Item found at index", index)


#create database
import random

def generate_database(n):
    graph = {}
    for i in range(n):
        vertex = chr(ord("A") + i)
        graph[vertex] = {}
        for j in range(n):
            if i != j:
                weight = random.randint(1, 10)
                graph[vertex][chr(ord("A") + j)] = weight
    return graph

database = generate_database(10)

def dijkstra(graph, start):
    distances = {}
    for vertex in graph:
        distances[vertex] = float("inf")

    distances[start] = 0
    unvisited = set(graph.keys())

    while unvisited:
        u = min(unvisited, key=lambda vertex: distances[vertex])
        unvisited.remove(u)

        for v, weight in graph[u].items():
            if distances[v] > distances[u] + weight:
                distances[v] = distances[u] + weight

    return distances

distances = dijkstra(database, "A")

print(distances)