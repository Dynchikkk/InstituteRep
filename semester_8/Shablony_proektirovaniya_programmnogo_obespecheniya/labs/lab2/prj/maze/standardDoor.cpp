#include "standardDoor.h"
#include <iostream>

/// <summary>
/// Constructs a StandardDoor that connects two rooms.
/// </summary>
/// <param name="r1">Pointer to the first room.</param>
/// <param name="r2">Pointer to the second room.</param>
StandardDoor::StandardDoor(Room* r1, Room* r2) : room1_(r1), room2_(r2), isOpen_(false) {}

/// <summary>
/// Defines the behavior when entering the door.
/// Outputs a message indicating that the door is encountered.
/// </summary>
void StandardDoor::Enter() {
    std::cout << "Door\n";
}

/// <summary>
/// Returns the room on the opposite side of the door.
/// </summary>
/// <param name="r">Pointer to the room from which the other side is requested.</param>
/// <returns>Pointer to the other room, or the same room if the input is neither connected</returns>
Room* StandardDoor::OtherSideFrom(Room* r) {
    return (r == room1_) ? room2_ : room1_;
}