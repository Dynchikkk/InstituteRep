#include "standardMazeFactory.h"

/// <summary>
/// Creates a new standard maze.
/// </summary>
/// <returns>Pointer to a newly created StandardMaze object. Caller takes ownership.</returns>
Maze* StandardMazeFactory::MakeMaze() const {
    return new StandardMaze;
}

/// <summary>
/// Creates a new standard wall.
/// </summary>
/// <returns>Pointer to a newly created StandardWall object. Caller takes ownership.</returns>
Wall* StandardMazeFactory::MakeWall() const {
    return new StandardWall;
}

/// <summary>
/// Creates a new standard room with the given number.
/// </summary>
/// <param name="n">Room number.</param>
/// <returns>Pointer to a newly created StandardRoom object. Caller takes ownership.</returns>
Room* StandardMazeFactory::MakeRoom(int n) const {
    return new StandardRoom(n);
}

/// <summary>
/// Creates a new standard door connecting two rooms.
/// </summary>
/// <param name="r1">Pointer to the first room.</param>
/// <param name="r2">Pointer to the second room.</param>
/// <returns>Pointer to a newly created StandardDoor object. Caller takes ownership.</returns>
Door* StandardMazeFactory::MakeDoor(Room* r1, Room* r2) const {
    return new StandardDoor(r1, r2);
}