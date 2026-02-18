#ifndef COUNTINGMAZEBUILDER_H
#define COUNTINGMAZEBUILDER_H

#include "mazeBuilder.h"

/// <summary>
/// Concrete builder that only counts the number of rooms and doors
/// </summary>
class CountingMazeBuilder : public MazeBuilder {
public:
    /// <summary>
    /// Constructs a CountingMazeBuilder with counters initialized to zero.
    /// </summary>
    CountingMazeBuilder();

    /// <summary>
    /// Does nothing, as this builder does not construct a maze.
    /// </summary>
    void BuildMaze() override {}

    /// <summary>
    /// Increments the room counter.
    /// </summary>
    /// <param name="room">Room number (ignored).</param>
    void BuildRoom(int) override;

    /// <summary>
    /// Increments the door counter.
    /// </summary>
    /// <param name="roomFrom">First room number (ignored).</param>
    /// <param name="roomTo">Second room number (ignored).</param>
    void BuildDoor(int, int) override;

    /// <summary>
    /// Returns nullptr, as this builder does not produce a maze.
    /// </summary>
    /// <returns>Always returns nullptr.</returns>
    Maze* GetMaze() override { return nullptr; }

    /// <summary>
    /// Retrieves the current counts of rooms and doors.
    /// </summary>
    /// <param name="rooms">Reference to an integer that will receive the room count.</param>
    /// <param name="doors">Reference to an integer that will receive the door count.</param>
    void GetCounts(int& rooms, int& doors) const;

private:
    /// Number of rooms counted.
    int rooms_; 
    /// Number of doors counted.
    int doors_; 
};

#endif // COUNTINGMAZEBUILDER_H