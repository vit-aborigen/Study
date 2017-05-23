import string, random
import numpy as np

class Board():
    def __init__(self, size, ships):
        self.board = [['.' for _ in range(size+1)] for j in range(size+1)]
        for i in range(size+1):
            self.board[0][i] = string.ascii_letters[i-1].upper()
            self.board[i][0] = i
        self.ships = ships

    # def __str__(self):
    #     s = [[str(i) for i in row] for row in self.board]
    #     lens = [max(map(len, col)) for col in zip(*s)]
    #     fmt = '\t'.join('{{:{}}}'.format(x) for x in lens)
    #     table = [fmt.format(*row) for row in s]
    #     return '\n'.join(table)

    def __str__(self):
        s = [[str(i) for i in row] for row in self.board]
        print(s)

        return '\n'.join(s)

    def __repr__(self):
        return self.__str__()

player = Board(8, {})
print(player)