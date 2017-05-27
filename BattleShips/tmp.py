import random

self_size = 8

def place_sheep(ship_size, board):

    def is_fit(ship_size, board, coord, orientation):
        """
        Check if the all cells around the ship are empty
        :param ship_size: 
        :param board: 
        :param coord: 
        :param orientation: 
        :return: True if empty, False otherwise
        """
        x,y = coord

        #checking cells around ship's square considering borders
        check_range_x = [x - 1 if (x-1) >= 0 else x, x + 1 if (x+1) < self_size else x]
        check_range_y = [y - 1 if (y-1) >= 0 else y, y + 1 if (y+1) < self_size else y]
        if orientation == 'vertical':
            check_range_x[1] += ship_size
            if check_range_x[1] > self_size-1:
                check_range_x[1] = self_size - 1
        else:
            check_range_y[1] += ship_size
            if check_range_y[1] > self_size - 1:
                check_range_y[1] = self_size - 1

        #check all squares around whole ship
        for x in range(check_range_x[0], check_range_x[1]+1):
            for y in range(check_range_y[0], check_range_y[1]+1):
                if board[x][y] != '.': return False
        return True

    # Generate random position (left top corner)
    isFit = False
    tries = 0

    #Due the restrictions of placing algorithm, sometimes there is no solution. In this case
    # reinitialization of board is required
    while not isFit:
        orientation = 'horizontal' if random.randint(0, 1) else 'vertical'
        if orientation == 'horizontal':
            x_random = random.randint(0, self_size - 1)
            y_random = random.randint(0, self_size - ship_size)
        else:
            x_random = random.randint(0, self_size - ship_size)
            y_random = random.randint(0, self_size - 1)
        isFit = is_fit(ship_size, board, (x_random,y_random), orientation)
        if tries > 1000:
            return False
        tries += 1

    # Check position
    if orientation == 'vertical':
        for x in range(x_random, x_random+ship_size):
            board[x][y_random] = str(ship_size)
    else:
        for y in range(y_random, y_random+ship_size):
            board[x_random][y] = str(ship_size)

    return True


def build():
    board = [['.'] * self_size for _ in range(self_size)]
    return board

board = build()
ships = [4, 3, 3, 2, 2, 2, 1, 1, 1, 1]

are_ships_placed = False
while not are_ships_placed:
    placing_result = True
    for ship in ships:
        placing_result = place_sheep(ship, board)
        if placing_result == False:
            board = build()
            break
    if placing_result == True:
        break


for row in board:
    print(' '.join(row))

