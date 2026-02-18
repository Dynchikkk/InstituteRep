#ifndef STANDARDMAZEFACTORY_H
#define STANDARDMAZEFACTORY_H

#include "mazeFactory.h"
#include "standardMaze.h"
#include "standardWall.h"
#include "standardRoom.h"
#include "standardDoor.h"

/// <summary>
/// Concrete factory that creates standard (ordinary) maze components.
/// </summary>
class StandardMazeFactory : public MazeFactory {
public:
    /// <summary>
    /// Creates a new standard maze.
    /// </summary>
    /// <returns>Pointer to a newly created StandardMaze object. Caller takes ownership.</returns>
    Maze* MakeMaze() const override;

    /// <summary>
    /// Creates a new standard wall.
    /// </summary>
    /// <returns>Pointer to a newly created StandardWall object. Caller takes ownership.</returns>
    Wall* MakeWall() const override;

    /// <summary>
    /// Creates a new standard room with the given number.
    /// </summary>
    /// <param name="n">Room number.</param>
    /// <returns>Pointer to a newly created StandardRoom object. Caller takes ownership.</returns>
    Room* MakeRoom(int n) const override;

    /// <summary>
    /// Creates a new standard door connecting two rooms.
    /// </summary>
    /// <param name="r1">Pointer to the first room.</param>
    /// <param name="r2">Pointer to the second room.</param>
    /// <returns>Pointer to a newly created StandardDoor object. Caller takes ownership.</returns>
    Door* MakeDoor(Room* r1, Room* r2) const override;
};

#endif // STANDARDMAZEFACTORY_H