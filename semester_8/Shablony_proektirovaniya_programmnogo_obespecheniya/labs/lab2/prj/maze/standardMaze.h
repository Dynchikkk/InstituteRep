#ifndef STANDARDMAZE_H
#define STANDARDMAZE_H

#include "maze.h"
#include <vector>

/// <summary>
/// Concrete class representing a standard maze implementation.
/// </summary>
class StandardMaze : public Maze {
public:
    /// <summary>
    /// Adds a room to the maze.
    /// </summary>
    /// <param name="r">Pointer to the Room object to be added. The maze takes ownership.</param>
    void AddRoom(Room* r) override;

    /// <summary>
    /// Retrieves a room by its number.
    /// </summary>
    /// <param name="n">The number of the room to find.</param>
    /// <returns>Pointer to the Room with the given number, or nullptr if not found.</returns>
    Room* RoomNo(int n) const override;

private:
    /// Container holding all rooms in the maze.
    std::vector<Room*> rooms_;   
};

#endif // STANDARDMAZE_H