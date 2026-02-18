#include "mazeGame.h"

/// <summary>
/// Creates a maze using the provided MazeFactory.
/// </summary>
/// <param name="factory">Reference to the factory used to create maze components.</param>
/// <returns>Pointer to the newly created Maze. Caller takes ownership.</returns>
Maze* MazeGame::CreateMaze(MazeFactory& factory) {
    // Create the maze container
    Maze* maze = factory.MakeMaze();

    // Create two rooms and a door connecting them
    Room* r1 = factory.MakeRoom(1);
    Room* r2 = factory.MakeRoom(2);
    Door* door = factory.MakeDoor(r1, r2);

    // Add rooms to the maze
    maze->AddRoom(r1);
    maze->AddRoom(r2);

    // Configure the first room: door on East, walls elsewhere
    r1->SetSide(North, factory.MakeWall());
    r1->SetSide(East, door);
    r1->SetSide(South, factory.MakeWall());
    r1->SetSide(West, factory.MakeWall());

    // Configure the second room: door on West, walls elsewhere
    r2->SetSide(North, factory.MakeWall());
    r2->SetSide(East, factory.MakeWall());
    r2->SetSide(South, factory.MakeWall());
    r2->SetSide(West, door);

    return maze;
}

/// <summary>
/// Creates a maze by delegating the construction steps to the provided MazeBuilder.
/// </summary>
/// <param name="builder">Reference to the builder that implements the construction steps.</param>
/// <returns>Pointer to the resulting Maze if the builder produces one, otherwise nullptr.</returns>
Maze* MazeGame::CreateMaze(MazeBuilder& builder) {
    builder.BuildMaze();
    builder.BuildRoom(1);
    builder.BuildRoom(2);
    builder.BuildDoor(1, 2);
    return builder.GetMaze();
}