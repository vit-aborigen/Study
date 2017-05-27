import random

SIZE = 8

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
        check_range_x = [x - 1 if (x-1) > 0 else x, x + 1 if (x+1) < SIZE else x]
        check_range_y = [y - 1 if (y-1) > 0 else y, y + 1 if (y+1) < SIZE else y]
        if orientation == 'horizontal':
            check_range_x[1] += ship_size
            if check_range_x[1] > SIZE-1:
                check_range_x[1] = SIZE-1
        else:
            check_range_y[1] += ship_size
            if check_range_y[1] > SIZE - 1:
                check_range_y[1] = SIZE - 1

        print("Checking range for ship:", ship_size, check_range_x, check_range_y, orientation)
        #check all squares around whole ship
        for x in range(check_range_x[0], check_range_x[1]+1):
            for y in range(check_range_y[0], check_range_y[1]+1):
                if board[x][y] != '.': return False
        return True

    # Generate random position (left top corner)
    isFit = False
    while not isFit:
        orientation = 'horizontal' if random.randint(0, 1) else 'vertical'
        if orientation == 'horizontal':
            x_random = random.randint(0, SIZE - 1)
            y_random = random.randint(0, SIZE - ship_size)
        else:
            x_random = random.randint(0, SIZE - ship_size)
            y_random = random.randint(0, SIZE - 1)
        print('Coordinates generated', (x_random, y_random))
        isFit = is_fit(ship_size, board, (x_random,y_random), orientation)

    # Check position
    if orientation == 'vertical':
        for x in range(x_random, x_random+ship_size):
            board[x][y_random] = str(ship_size)
    else:
        for y in range(y_random, y_random+ship_size):
            board[x_random][y] = str(ship_size)

    for row in board:
        print(' '.join(row))
    print('\n')

ships = [4, 4]
board = [['.']*SIZE for _ in range(SIZE)]
for ship in ships:
    place_sheep(ship, board)
