import string, random

class Board():
    def __init__(self, size, ships):
        self.size = size
        self.board = [['.' for _ in range(size+1)] for j in range(size+1)]
        for i in range(size+1):
            self.board[0][i] = string.ascii_letters[i-1].upper()
            self.board[i][0] = i
        self.ships = ships

    def __str__(self):
        s = [[str(i) for i in row] for row in self.board]
        lens = [max(map(len, col)) for col in zip(s)]
        table = [' '.join(row) for row in s]
        return '\n'.join(table)

    def place_ships(self):
        pass