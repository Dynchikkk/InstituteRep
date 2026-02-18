#ifndef MAZEBUILDER_H
#define MAZEBUILDER_H

#include "maze.h"

/// <summary>
/// Abstract builder class that defines the steps to construct a maze.
/// Specific builders implement these steps to create different representations of a maze.
/// </summary>
class MazeBuilder {
public:
    virtual ~MazeBuilder() = default;

    /// <summary>
    /// Initiates the construction of a new maze.
    /// This method should be called before adding any rooms or doors.
    /// </summary>
    virtual void BuildMaze() = 0;

    /// <summary>
    /// Constructs a room with the given room number.
    /// </summary>
    /// <param name="room">The number of the room to build.</param>
    virtual void BuildRoom(int room) = 0;

    /// <summary>
    /// Constructs a door connecting two rooms.
    /// </summary>
    /// <param name="roomFrom">Number of the first room.</param>
    /// <param name="roomTo">Number of the second room.</param>
    virtual void BuildDoor(int roomFrom, int roomTo) = 0;

    /// <summary>
    /// Returns the constructed maze object.
    /// The caller takes ownership of the returned pointer.
    /// </summary>
    /// <returns>Pointer to the completed Maze, or nullptr if not yet built.</returns>
    virtual Maze* GetMaze() = 0;
};

#endif // MAZEBUILDER_H