#include "standardMazeBuilder.h"

StandardMazeBuilder::StandardMazeBuilder(MazeFactory& factory)
    : factory_(factory), currentMaze_(nullptr) {
}

void StandardMazeBuilder::BuildMaze() {
    currentMaze_ = factory_.MakeMaze();  // через фабрику
}

void StandardMazeBuilder::BuildRoom(int room) {
    if (!currentMaze_->RoomNo(room)) {
        Room* r = factory_.MakeRoom(room);  // через фабрику
        currentMaze_->AddRoom(r);
        // Стены тоже через фабрику
        r->SetSide(North, factory_.MakeWall());
        r->SetSide(South, factory_.MakeWall());
        r->SetSide(East, factory_.MakeWall());
        r->SetSide(West, factory_.MakeWall());
    }
}

void StandardMazeBuilder::BuildDoor(int roomFrom, int roomTo) {
    Room* r1 = currentMaze_->RoomNo(roomFrom);
    Room* r2 = currentMaze_->RoomNo(roomTo);
    if (r1 && r2) {
        Door* d = factory_.MakeDoor(r1, r2);  // через фабрику
        r1->SetSide(North, d);
        r2->SetSide(South, d);
    }
}

Maze* StandardMazeBuilder::GetMaze() {
    return currentMaze_;
}