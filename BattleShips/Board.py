import string, random

class Board():
    def __init__(self, size, owner, ships = []):
        self.size = size
        self.ships = ships
        self.owner = owner
        self.board = self.build()

    def build(self):
        return [['.'] * self.size for _ in range(self.size)]

    def __str__(self):
        s = [[str(i) for i in row] for row in self.board]
        table = [' '.join(row) for row in s]
        return '\n'.join(table)

    def add_ship(self, ship_size):
        def is_fit(ship_size, coord, orientation):
            """
            Check if the all cells around the ship are empty
            :param ship_size: 
            :param coord: 
            :param orientation: 
            :return: True if ship can be placed on board, False otherwise
            """
            x, y = coord

            # checking cells around ship's square considering borders
            check_range_x = [x - 1 if (x - 1) >= 0 else x, x + 1 if (x + 1) < self.size else x]
            check_range_y = [y - 1 if (y - 1) >= 0 else y, y + 1 if (y + 1) < self.size else y]
            if orientation == 'vertical':
                check_range_x[1] = min(check_range_x[1] + ship_size, self.size - 1)
            else:
                check_range_y[1] = min(check_range_y[1] + ship_size, self.size - 1)

            # check all squares around whole ship
            for x in range(check_range_x[0], check_range_x[1] + 1):
                for y in range(check_range_y[0], check_range_y[1] + 1):
                    if self.board[x][y] != '.': return False
            return True

        # Generate random position (left top corner)
        # Due the restrictions of placing algorithm, sometimes there is no solution. In this case
        # reinitialization of board is performed
        isFit = False
        tries = 0
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

    def check_cell(self, cell):
        '''
        Returns 1 if hit, 0 for miss

        '''
        y,x = cell
        if self.board[x][y] in '1234567890':
            self.board[x][y] = 'X'
            return 1
        else:
            self.board[x][y] = 'o'
            return 0

