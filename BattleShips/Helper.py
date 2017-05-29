from Ship import Ship
from Board import Board
import string

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
            max_ship_size = input("Enter largest ship size (1-%s): " % (str(min(board_size//2, 8))))
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

    def print_boards(self, board_1, board_2, show_opponent_board = False):
        fmt = '{:^' + str(board_1.size*2 - 1) + '}'
        print('\n'+fmt.format(board_1.owner) + ' '*8 + fmt.format(board_2.owner))
        headers = ' '.join([string.ascii_letters[i].upper() for i in range(board_1.size)])
        print(headers + ' '*8 + headers)
        board_pc = board_2.board if show_opponent_board else [['.'] * board_2.size for _ in range(board_2.size)]
        for idx, (row1, row2) in enumerate(zip(board_1.board, board_pc)):
                print(' '.join(row1) + '   %2d   ' %(idx+1) + ' '.join(row2))

    def initialize_navy(self):
        navy = []
        for size in range(self.max_ship_size, 0, -1):
            navy.extend([Ship(size) for _ in range(self.max_ship_size - size + 1)])
        return navy, navy[::1]

    def place_navy(self, board: Board, navy):
        ships = [ship.get_size() for ship in navy]
        are_ships_placed = False
        while not are_ships_placed:
            placing_result = True
            for ship in ships:
                placing_result = board.add_ship(ship)
                if not placing_result:
                    board.board = board.build()
                    break
            if placing_result:
                return True
        return False

    def ask_user(self, board):
        size = board.size
        is_cell_correct = False
        while not is_cell_correct:
            try:
                user_input = input("Enter cell in LetterNumber format (i.e. A8")
                x = user_input[0]
                y = int(user_input[1:])
                # if 'check range'
                is_cell_correct = True
            except ValueError:
                print("Cast error")
