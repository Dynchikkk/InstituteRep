#ifndef STANDARDMAZEBUILDER_H
#define STANDARDMAZEBUILDER_H

#include "mazeBuilder.h"
#include "mazeFactory.h"

/// <summary>
/// Concrete builder that constructs a standard maze using a provided factory.
/// </summary>
class StandardMazeBuilder : public MazeBuilder {
public:
    /// <summary>
    /// Constructs a StandardMazeBuilder with a reference to a MazeFactory.
    /// </summary>
    /// <param name="factory">Reference to the factory used to create maze components.</param>
    explicit StandardMazeBuilder(MazeFactory& factory);

    /// <summary>
    /// Initializes the construction of a new maze.
    /// Creates an empty maze using the factory.
    /// </summary>
    void BuildMaze() override;

    /// <summary>
    /// Builds a room with the given number and adds it to the current maze.
    /// </summary>
    /// <param name="room">The number of the room to build.</param>
    void BuildRoom(int room) override;

    /// <summary>
    /// Builds a door connecting two existing rooms.
    /// </summary>
    /// <param name="roomFrom">Number of the first room.</param>
    /// <param name="roomTo">Number of the second room.</param>
    void BuildDoor(int roomFrom, int roomTo) override;

    /// <summary>
    /// Returns the constructed maze object.
    /// </summary>
    /// <returns>Pointer to the completed maze, or nullptr if not yet built.</returns>
    Maze* GetMaze() override;

private:
    /// Reference to the factory used for creating components.
    MazeFactory& factory_;  
    /// Pointer to the maze currently being built (may be nullptr).
    Maze* currentMaze_;      
};

#endif // STANDARDMAZEBUILDER_H