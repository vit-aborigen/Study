import string

class Board():
    def __init__(self, size, ship_config):
        self.board = [['O' for _ in range(size+1)] for j in range(size+1)]
        for i in range(size+1):
            self.board[0][i] = string.ascii_letters[i-1].upper()
            self.board[i][0] = i
        self.ships = ship_config


    def print_board(self):
        for row in self.board:
            print(row)

player = Board(3, {})
player.print_board()