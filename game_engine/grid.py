from enum import Enum, auto


class GameState(Enum):
    ONGOING = auto()
    X_WON = auto()
    O_WON = auto()
    DRAW = auto()


class Grid:
    def __init__(self):
        self._grid = [[' ', ' ', ' '],
                      [' ', ' ', ' '],
                      [' ', ' ', ' ']]
        self._next_player = 'X'
        self._state = GameState.ONGOING

    def _change_player(self):
        if self._next_player == 'X':
            self._next_player = 'O'
        else:
            self._next_player = 'X'

    def take_turn(self, x, y):
        self._grid[x][y] = self._next_player
        self._change_player()
        return self._check_winner()

    def _check_winner(self):
        for row in self._grid:
            if row[0] == row[1] and row[1] == row[2]:
                if row[0] == 'X':
                    self._state = GameState.X_WON
                    return True
                if row[0] == 'O':
                    self._state = GameState.O_WON
                    return True

        for i in range(0, 3):
            if self._grid[0][i] == self._grid[1][i] and self._grid[1][i] == self._grid[2][i]:
                if self._grid[0][i] == 'X':
                    self._state = GameState.X_WON
                    return True
                if self._grid[0][i] == 'O':
                    self._state = GameState.O_WON
                    return True

        if self._grid[0][0] == self._grid[1][1] and self._grid[1][1] == self._grid[2][2]:
            if self._grid[0][0] == 'X':
                self._state = GameState.X_WON
                return True
            if self._grid[0][0] == 'O':
                self._state = GameState.O_WON
                return True

        if self._grid[2][0] == self._grid[1][1] and self._grid[1][1] == self._grid[0][2]:
            if self._grid[0][2] == 'X':
                self._state = GameState.X_WON
                return True
            if self._grid[0][2] == 'O':
                self._state = GameState.O_WON
                return True

        return self._check_draw()

    def _check_draw(self):
        for i in range(0, len(self._grid)):
            for j in range(0, len(self._grid[0])):
                if self._grid[i][j] == ' ':
                    return False
        self._state = GameState.DRAW
        return True

    def get_next_player(self):
        return self._next_player

    def get_end_result(self):
        if self._state == GameState.O_WON:
            return "O has won"
        if self._state == GameState.X_WON:
            return "X has won"
        if self._state == GameState.DRAW:
            return "DRAW"

    def get_value(self, x, y):
        return self._grid[x][y]

    def restart(self):
        for i in range(0, len(self._grid)):
            for j in range(0, len(self._grid[0])):
                self._grid[i][j] = ' '
        self._next_player = 'X'
        self._state = GameState.ONGOING

    def get_next_message(self):
        if self._state == GameState.ONGOING:
            return f"{self._next_player} is next"
        else:
            return f"The game is over, {self.get_end_result()}"
