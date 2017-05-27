from Ship import Ship
from Board import Board

class Game():
    def __init__(self):
        self.board_size, self.max_ship_size = self.get_data_from_user()
        self.navy = self.initialize_navy()

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
                    max_ship_size = int(input("Enter correct size of largest ship: "))
                    continue
                ships_set = True
            except ValueError:
                print("Value should be integer")

        return (board_size, max_ship_size)

    def initialize_boards(self):
        user_board = Board(self.board_size, "Player")
        pc_board = Board(self.board_size, "Computer")
        return user_board, pc_board


    def print_boards(self, board_1, board_2):
        raise NotImplemented

    def initialize_navy(self):
        navy = []
        for size in range(self.max_ship_size, 0, -1):
            navy.extend([Ship(size) for _ in range(self.max_ship_size - size + 1)])
        return navy, navy[::1]

    def place_navy(self, board: Board, navy):
        ships = [item.get_size() for item in navy]
        are_ships_placed = False
        while not are_ships_placed:
            placing_result = True
            for ship in ships:
                placing_result = board.add_ship(ship)
                if placing_result == False:
                    board.board = board.build()
                    break
            if placing_result == True:
                break




