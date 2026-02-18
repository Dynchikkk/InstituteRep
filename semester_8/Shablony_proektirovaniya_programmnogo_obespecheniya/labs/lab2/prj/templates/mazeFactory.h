#ifndef MAZEFACTORY_H
#define MAZEFACTORY_H

#include "maze.h"
#include "wall.h"
#include "room.h"
#include "door.h"

/// <summary>
/// Abstract factory for creating maze components.
/// Defines interface for creating all necessary objects for building a maze.
/// </summary>
class MazeFactory {
public:
    virtual ~MazeFactory() = default;

    /// <summary>
    /// Creates a new maze object.
    /// </summary>
    /// <returns>Pointer to the newly created Maze. Caller takes ownership.</returns>
    virtual Maze* MakeMaze() const = 0;

    /// <summary>
    /// Creates a new wall object.
    /// </summary>
    /// <returns>Pointer to the newly created Wall. Caller takes ownership.</returns>
    virtual Wall* MakeWall() const = 0;

    /// <summary>
    /// Creates a new room with the specified number.
    /// </summary>
    /// <param name="n">Room number.</param>
    /// <returns>Pointer to the newly created Room. Caller takes ownership.</returns>
    virtual Room* MakeRoom(int n) const = 0;

    /// <summary>
    /// Creates a new door connecting two rooms.
    /// </summary>
    /// <param name="r1">Pointer to the first room.</param>
    /// <param name="r2">Pointer to the second room.</param>
    /// <returns>Pointer to the newly created Door. Caller takes ownership.</returns>
    virtual Door* MakeDoor(Room* r1, Room* r2) const = 0;
};

#endif // MAZEFACTORY_H