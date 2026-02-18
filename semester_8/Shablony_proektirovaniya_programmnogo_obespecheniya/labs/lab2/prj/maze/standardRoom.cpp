#include <iostream>
#include "standardRoom.h"

/// <summary>
/// Constructs a standard room with the given room number.
/// </summary>
/// <param name="roomNumber">The unique identifier/number of the room.</param>
StandardRoom::StandardRoom(int roomNumber) : roomNumber_(roomNumber) {
    sides_.resize(4, nullptr);
}

/// <summary>
/// Places a MapSite on the specified side of the room.
/// </summary>
/// <param name="dir">The side (North, South, East, West) where the site is placed.</param>
/// <param name="site">Pointer to the MapSite to set on that side.</param>
void StandardRoom::SetSide(Direction dir, MapSite* site) {
    sides_[dir] = site;
}

/// <summary>
/// Retrieves the MapSite on the specified side of the room.
/// </summary>
/// <param name="dir">The side to query.</param>
/// <returns>Pointer to the MapSite on that side, or nullptr if not set.</returns>
MapSite* StandardRoom::GetSide(Direction dir) const {
    return sides_[dir];
}

/// <summary>
/// Returns the room number.
/// </summary>
/// <returns>The integer identifier of the room.</returns>
int StandardRoom::GetNumber() const {
    return roomNumber_;
}

/// <summary>
/// Defines the behavior when entering the room.
/// </summary>
void StandardRoom::Enter() {
    std::cout << "You are in room " << roomNumber_ << "\n";
}