import string, random

class Board():
    def __init__(self, size, owner, ships = []):
        self.size = size
        self.ships = ships
        self.owner = owner
        self.build()

    def build(self):
        # board = [['.' for _ in range(self.size+1)] for j in range(size+1)]
        # for i in range(self.size+1):
        #     self.board[0][i] = string.ascii_letters[i-1].upper()
        #     self.board[i][0] = i
        self.board = [['.'] * self.size for _ in range(self.size)]

    def __str__(self):
        s = [[str(i) for i in row] for row in self.board]
        lens = [max(map(len, col)) for col in zip(s)]
        table = [' '.join(row) for row in s]
        return '\n'.join(table)

    def add_ship(self, ship_size):
        def is_fit(ship_size, coord, orientation):
            """
            Check if the all cells around the ship are empty
            :param ship_size: 
            :param board: 
            :param coord: 
            :param orientation: 
            :return: True if empty, False otherwise
            """
            x, y = coord

            # checking cells around ship's square considering borders
            check_range_x = [x - 1 if (x - 1) >= 0 else x, x + 1 if (x + 1) < self.size else x]
            check_range_y = [y - 1 if (y - 1) >= 0 else y, y + 1 if (y + 1) < self.size else y]
            if orientation == 'vertical':
                check_range_x[1] += ship_size
                if check_range_x[1] > self.size - 1:
                    check_range_x[1] = self.size - 1
            else:
                check_range_y[1] += ship_size
                if check_range_y[1] > self.size - 1:
                    check_range_y[1] = self.size - 1

            # check all squares around whole ship
            for x in range(check_range_x[0], check_range_x[1] + 1):
                for y in range(check_range_y[0], check_range_y[1] + 1):
                    if self.board[x][y] != '.': return False
            return True

        # Generate random position (left top corner)
        isFit = False
        tries = 0

        # Due the restrictions of placing algorithm, sometimes there is no solution. In this case
        # reinitialization of board is required
        while not isFit:
            orientation = 'horizontal' if random.randint(0, 1) else 'vertical'
            if orientation == 'horizontal':
                x_random = random.randint(0, self.size - 1)
                y_random = random.randint(0, self.size - ship_size)
            else:
                x_random = random.randint(0, self.size - ship_size)
                y_random = random.randint(0, self.size - 1)
            isFit = is_fit(ship_size, (x_random, y_random), orientation)
            if tries > 1000:
                return False
            tries += 1

        # Check position
        if orientation == 'vertical':
            for x in range(x_random, x_random + ship_size):
                self.board[x][y_random] = str(ship_size)
        else:
            for y in range(y_random, y_random + ship_size):
                self.board[x_random][y] = str(ship_size)

        return True


user_board = Board(8, "Player")

ships = [4, 3, 3, 2, 2, 2, 1, 1, 1, 1]

are_ships_placed = False
while not are_ships_placed:
    placing_result = True
    for ship in ships:
        placing_result = user_board.add_ship(ship)
        if placing_result == False:
            board = user_board.build()
            break
    if placing_result == True:
        break


