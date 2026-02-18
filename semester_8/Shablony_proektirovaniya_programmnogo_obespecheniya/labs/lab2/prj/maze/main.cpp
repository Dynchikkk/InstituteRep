#include <iostream>
#include "mazeGame.h"
#include "standardMazeFactory.h"
#include "standardMazeBuilder.h"
#include "countingMazeBuilder.h"

/// <summary>
/// Entry point for the maze construction demonstration.
/// Showcases three different approaches:
/// 1. Direct construction using Factory Method (MazeFactory)
/// 2. Counting components using CountingMazeBuilder (Builder pattern)
/// 3. Construction using StandardMazeBuilder with a factory
/// </summary>
int main() {
    MazeGame game;

    StandardMazeFactory factory;
    Maze* maze = game.CreateMaze(factory);
    std::cout << "Maze built with Factory Method.\n";
    if (maze) {
        Room* r = maze->RoomNo(1);
        if (r) r->Enter();          
        r = maze->RoomNo(2);
        if (r) r->Enter();          
    }
    delete maze;                    
    std::cout << "----------------------\n";

    CountingMazeBuilder counter;
    game.CreateMaze(counter);        
    int rooms, doors;
    counter.GetCounts(rooms, doors); 
    std::cout << "CountingMazeBuilder:\n";
    std::cout << "Rooms: " << rooms << ", Doors: " << doors << "\n";
    std::cout << "----------------------\n";

    StandardMazeBuilder builder(factory);
    Maze* maze2 = game.CreateMaze(builder);
    std::cout << "Maze built with StandardMazeBuilder.\n";
    if (maze2) {
        Room* r = maze2->RoomNo(1);
        if (r) r->Enter();           
        r = maze2->RoomNo(2);
        if (r) r->Enter();           
    }
    delete maze2;                    

    return 0;
}