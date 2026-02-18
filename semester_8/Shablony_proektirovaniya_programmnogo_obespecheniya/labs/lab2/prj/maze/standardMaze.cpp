#include "standardMaze.h"

/// <summary>
/// Adds a room to the maze.
/// </summary>
/// <param name="r">Pointer to the Room object to be added. The maze takes ownership.</param>
void StandardMaze::AddRoom(Room* r) {
    rooms_.push_back(r);
}

/// <summary>
/// Retrieves a room by its number.
/// </summary>
/// <param name="n">The number of the room to find.</param>
/// <returns>Pointer to the Room with the given number, or nullptr if not found.</returns>
Room* StandardMaze::RoomNo(int n) const {
    for (auto r : rooms_) {
        if (r->GetNumber() == n) {
            return r;
        }
    }

    return nullptr;
}