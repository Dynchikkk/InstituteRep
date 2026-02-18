#include "CountingMazeBuilder.h"

CountingMazeBuilder::CountingMazeBuilder() : rooms_(0), doors_(0) {}

void CountingMazeBuilder::BuildRoom(int) {
    ++rooms_;
}

void CountingMazeBuilder::BuildDoor(int, int) {
    ++doors_;
}

void CountingMazeBuilder::GetCounts(int& rooms, int& doors) const {
    rooms = rooms_;
    doors = doors_;
}