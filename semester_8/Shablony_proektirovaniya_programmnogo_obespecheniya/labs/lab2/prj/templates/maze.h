#ifndef MAZE_H
#define MAZE_H

#include "room.h"

/// <summary>
/// Abstract base class representing a maze composed of rooms.
/// </summary>
class Maze {
public:
    virtual ~Maze() = default;

    /// <summary>
    /// Adds a room to the maze.
    /// </summary>
    /// <param name="r">Pointer to the Room object to be added. The maze takes ownership.</param>
    virtual void AddRoom(Room* r) = 0;

    /// <summary>
    /// Retrieves a room by its number.
    /// </summary>
    /// <param name="n">The number of the room to find.</param>
    /// <returns>Pointer to the Room with the given number, or nullptr if not found.</returns>
    virtual Room* RoomNo(int n) const = 0;
};

#endif // MAZE_H