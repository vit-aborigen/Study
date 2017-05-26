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
        if board[x][y] != '.':
            return False

        #checking cells around ship's square considering borders
        check_range_x = [x - 1 if x > 0 else x, x + 1 if x < SIZE else x]
        check_range_y = [y - 1 if y > 0 else y, y + 1 if y < SIZE else y]
        if orientation == 'horizontal':
            check_range_x[1] += ship_size
            if check_range_x[1] > SIZE-1:
                check_range_x[1] = SIZE-1
        else:
            check_range_y[1] += ship_size
            if check_range_y[1] > SIZE - 1:
                check_range_y[1] = SIZE - 1


        print("Checking range for ship:", ship_size, check_range_x, check_range_y)
        #check all squares around whole ship
        for x in check_range_x:
            for y in check_range_y:
                if board[x][y] != '.': return False
        return True

    # Generate random position (left top corner)
    orientation = 'horizontal' if random.randint(0, 1) else 'vertical'
    x_random = random.randint(0, SIZE - ship_size)
    y_random = random.randint(0, SIZE - ship_size)
    while not is_fit(ship_size, board, (x_random,y_random), orientation):
        orientation = 'horizontal' if random.randint(0,1) else 'vertical'
        x_random = random.randint(0, SIZE-ship_size)
        y_random = random.randint(0, SIZE-ship_size)

    # Check position
    # if is_fit(ship_size, board, (x_random,y_random), orientation):
    if orientation == 'horizontal':
        for x in range(x_random, x_random+ship_size):
            board[x][y_random] = str(ship_size)
    else:
        for y in range(y_random, y_random+ship_size):
            board[x_random][y] = str(ship_size)

    for row in board:
        print(' '.join(row))
    print('\n')

ships = [4, 3, 3, 2, 2, 2, 1, 1, 1, 1]
board = [['.']*SIZE for _ in range(SIZE)]
for ship in ships:
    place_sheep(ship, board)
