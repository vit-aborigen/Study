from Ship import Ship
from Board import Board

class Game():
    def __init__(self):
        self.board_size, self.max_ship_size = self.get_data_from_user()

    def get_data_from_user(self):
        board_set, ships_set = False, False

        #get user values for board and ships
        while not board_set:
            board_size = input("Enter board size (5-20): ")
            try:
                board_size = int(board_size)
                if board_size not in range(5, 21):
                    board_size = int(input("Enter correct size of board (5-20): "))
                    continue
                board_set = True
            except ValueError:
                print("Value should be integer")

        while not ships_set:
            max_ship_size = input("Enter largest ship size (1-%s): " % (str(board_size//2)))
            try:
                max_ship_size = int(max_ship_size)
                if max_ship_size not in range(1, 10) or max_ship_size > board_size//2:
                    board_size = int(input("Enter correct size of largest ship: "))
                    continue
                ships_set = True
            except ValueError:
                print("Value should be integer")

        return (board_size, max_ship_size)

    def initialize_boards(self):


    def print_boards(self, board_1, board_2):
        print(board_1)
        print(board_2)

    def initialize_ships(self):
        pass





