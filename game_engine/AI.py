import time

from game_engine.grid import Grid, GameState


class GridWithAI(Grid):
    def __init__(self, play_as):
        super().__init__()
        self._play_as = play_as
        self._first_move_taken = False
        if self._play_as == "X":
            self._opposition = "O"
            self.ai_move()
        else:
            self._opposition = "X"

    def ai_move(self):
        if self._state == GameState.ONGOING:
            if self._first_move_taken is False:
                self._first_move_taken = True
                if self._play_as == "X":
                    return self.take_turn(0, 0)
                else:
                    if self._grid[1][1] != 'X':
                        return self.take_turn(1, 1)
            x, y = self._can_win(self._play_as)
            if x or y:
                return self.take_turn(x, y)
            x, y = self._can_win(self._opposition)
            if x or y:
                return self.take_turn(x, y)
            if self._play_as != "X":
                x, y = self._defensive_plays_as_o()
            if x or y or (x == 0 and y == 0):
                return self.take_turn(x, y)
            x, y = self._unoccupied_opposite_corner()
            if x or y:
                return self.take_turn(x, y)
            x, y = self._move_at_random()
            return self.take_turn(x, y)


    def _can_win(self, player_to_check):
        #check rows

            #first row
        if self._grid[0][0] == player_to_check:
            if self._grid[0][1] == player_to_check and self._grid[0][2] == ' ':
                return 0, 2
            if self._grid[0][2] == player_to_check and self._grid[0][1] == ' ':
                return 0, 1

        if self._grid[0][1] == player_to_check:
            if self._grid[0][0] == player_to_check and self._grid[0][2] == ' ':
                return 0, 2
            if self._grid[0][2] == player_to_check and self._grid[0][0] == ' ':
                return 0, 0

            #second row
        if self._grid[1][0] == player_to_check:
            if self._grid[1][1] == player_to_check and self._grid[1][2] == ' ':
                return 1, 2
            if self._grid[1][2] == player_to_check and self._grid[1][1] == ' ':
                return 1, 1

        if self._grid[1][1] == player_to_check:
            if self._grid[1][0] == player_to_check and self._grid[1][2] == ' ':
                return 1, 2
            if self._grid[1][2] == player_to_check and self._grid[1][0] == ' ':
                return 1, 0

            #third row
        if self._grid[2][0] == player_to_check:
            if self._grid[2][1] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2
            if self._grid[2][2] == player_to_check and self._grid[2][1] == ' ':
                return 2, 1

        if self._grid[2][1] == player_to_check:
            if self._grid[2][0] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2
            if self._grid[2][2] == player_to_check and self._grid[2][0] == ' ':
                return 2, 0

        #check columns
            #first column
        if self._grid[0][0] == player_to_check:
            if self._grid[1][0] == player_to_check and self._grid[2][0] == ' ':
                return 2, 0
            if self._grid[2][0] == player_to_check and self._grid[1][0] == ' ':
                return 1, 0

        if self._grid[1][0] == player_to_check:
            if self._grid[0][0] == player_to_check and self._grid[2][0] == ' ':
                return 2, 0
            if self._grid[2][0] == player_to_check and self._grid[0][0] == ' ':
                return 0, 0

            #second column
        if self._grid[0][1] == player_to_check:
            if self._grid[1][1] == player_to_check and self._grid[2][1] == ' ':
                return 2, 1
            if self._grid[2][1] == player_to_check and self._grid[1][1] == ' ':
                return 1, 1

        if self._grid[1][1] == player_to_check:
            if self._grid[0][1] == player_to_check and self._grid[2][1] == ' ':
                return 2, 1
            if self._grid[2][1] == player_to_check and self._grid[0][1] == ' ':
                return 0, 1

            #third column
        if self._grid[0][2] == player_to_check:
            if self._grid[1][2] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2
            if self._grid[2][2] == player_to_check and self._grid[1][2] == ' ':
                return 1, 2

        if self._grid[1][2] == player_to_check:
            if self._grid[0][2] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2
            if self._grid[2][2] == player_to_check and self._grid[0][2] == ' ':
                return 0, 2

        #check diagonals
        if self._grid[0][0] == player_to_check:
            if self._grid[2][2] == player_to_check and self._grid[1][1] == ' ':
                return 1, 1
            if self._grid[1][1] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2

        if self._grid[2][0] == player_to_check:
            if self._grid[0][2] == player_to_check and self._grid[1][1] == ' ':
                return 1, 1
            if self._grid[1][1] == player_to_check and self._grid[0][2] == ' ':
                return 0, 2

        if self._grid[1][1] == player_to_check:
            if self._grid[0][2] == player_to_check and self._grid[2][0] == ' ':
                return 2, 0
            if self._grid[2][0] == player_to_check and self._grid[0][2] == ' ':
                return 0, 2
            if self._grid[2][2] == player_to_check and self._grid[0][0] == ' ':
                return 0, 0
            if self._grid[0][0] == player_to_check and self._grid[2][2] == ' ':
                return 2, 2

        return None, None

    def _unoccupied_opposite_corner(self):
        # best opposite corner play
        if self._grid[0][0] == self._play_as:
            if self._grid[2][2] == ' ':
                return 2, 2

        if self._grid[2][2] == self._play_as:
            if self._grid[0][0] == ' ':
                return 0, 0

        if self._grid[2][0] == self._play_as:
            if self._grid[0][2] == ' ':
                return 0, 2

        if self._grid[0][2] == self._play_as:
            if self._grid[2][0] == ' ':
                return 2, 0

        #second best opposite corner play
        if self._grid[0][0] == ' ' and (self._grid[0][1] == ' ' or self._grid[1][0] == ' '):
            return 0, 0

        if self._grid[2][2] == ' ' and (self._grid[2][1] == ' ' or self._grid[1][2] == ' '):
            return 2, 2

        if self._grid[0][2] == ' ' and (self._grid[0][1] == ' ' or self._grid[1][2] == ' '):
            return 0, 2

        if self._grid[2][0] == ' ' and (self._grid[2][1] == ' ' or self._grid[1][0] == ' '):
            return 2, 0

        #play any corner
        if self._grid[0][0] == ' ':
            return 0, 0

        if self._grid[2][2] == ' ':
            return 2, 2

        if self._grid[0][2] == ' ':
            return 0, 2

        if self._grid[2][0] == ' ':
            return 2, 0
        return None, None

    def _move_at_random(self):
        for i in range(0, 3):
            for j in range(0, 3):
                if self._grid[i][j] == ' ':
                    return i, j

    def _is_o_second_move(self):
        number_of_xs = 0
        number_of_os = 0
        for i in range(0, 3):
            for j in range(0, 3):
                if self._grid[i][j] == "X":
                    number_of_xs += 1
                if self._grid[i][j] == "O":
                    number_of_os += 1

        if number_of_xs == 2 and number_of_os == 1:
            return True
        return False

    def _o_move_against_corner(self):
        if self._grid[0][1] != "X" and self._grid[1][2] != "X" and self._grid[1][0] != "X" and self._grid[2][1] != "X" and self._grid[1][1] != "X":
            return True

        return False

    def _defensive_plays_as_o(self):
        # O special second move to draw
        if self._is_o_second_move():
            if self._o_move_against_corner():
                if self._grid[0][1] == ' ':
                    return 0, 1
                if self._grid[1][2] == ' ':
                    return 1, 2
                if self._grid[1][0] == ' ':
                    return 1, 0
                if self._grid[2][1] == ' ':
                    return 2, 1
            else:
                if self._grid[0][0] == "X" and self._grid[2][1] == "X":
                    return 2, 0
                if self._grid[0][2] == "X" and self._grid[2][1] == "X":
                    return 2, 2
                if self._grid[0][1] == "X" and self._grid[1][0] == "X":
                    return 0, 0
                if self._grid[2][1] == "X" and self._grid[1][2] == "X":
                    return 2, 2
                if self._grid[2][0] == "X" and self._grid[1][2] == "X":
                    return 2, 2
                if self._grid[2][2] == "X" and self._grid[1][1] == "X":
                    return 0, 2

        return None, None

    def restart(self):
        self._first_move_taken = False
        super().restart()
        if self._play_as == "X":
            self.ai_move()


