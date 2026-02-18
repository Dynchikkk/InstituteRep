#ifndef MAZEGAME_H
#define MAZEGAME_H

#include "mazeFactory.h"
#include "mazeBuilder.h"

/// <summary>
/// MazeGame class responsible for creating mazes using different construction approaches.
/// </summary>
class MazeGame {
public:
    /// <summary>
    /// Creates a maze using the provided MazeFactory.
    /// </summary>
    /// <param name="factory">Reference to the factory used to create maze components.</param>
    /// <returns>Pointer to the newly created Maze. Caller takes ownership.</returns>
    Maze* CreateMaze(MazeFactory& factory);

    /// <summary>
    /// Creates a maze by delegating the construction steps to the provided MazeBuilder.
    /// </summary>
    /// <param name="builder">Reference to the builder that implements the construction steps.</param>
    /// <returns>Pointer to the resulting Maze if the builder produces one, otherwise nullptr.</returns>
    Maze* CreateMaze(MazeBuilder& builder);
};

#endif // MAZEGAME_H