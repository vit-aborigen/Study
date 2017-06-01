from Ship import Ship
from Board import Board
import string, random

class Game():
    def __init__(self):
        self.board_size, self.max_ship_size = self.get_data_from_user()
        self.user_navy, self.pc_navy = self.initialize_navy()
        self.user_board, self.pc_board = self.initialize_boards()
        if not (self.place_navy(self.user_board, self.user_navy) and self.place_navy(self.pc_board, self.pc_navy)):
            raise EnvironmentError("Error occurred during navy placing")
        self.print_boards(self.user_board, self.pc_board)

    def get_data_from_user(self):
        board_set, ships_set = False, False

        #get user values for board and ships
        while not board_set:
            board_size = input("Enter board size (5-20): ")
            try:
                board_size = int(board_size)
                if board_size not in range(5, 21):
                    board_size = int(input("Enter correct size of the board (5-20): "))
                    continue
                board_set = True
            except ValueError:
                print("Value should be integer")

        while not ships_set:
            max_ship_size = input("Enter largest ship size (1-%s): " % (str(min(board_size//2, 8))))
            try:
                max_ship_size = int(max_ship_size)
                if max_ship_size not in range(1, 9) or max_ship_size > board_size//2:
                    max_ship_size = int(input("Enter correct size of the largest ship: "))
                    continue
                ships_set = True
            except ValueError:
                print("Value should be integer")

        return (board_size, max_ship_size)

    def initialize_boards(self):
        user_board = Board(self.board_size, "Player")
        pc_board = Board(self.board_size, "Computer")
        return user_board, pc_board

    # def print_boards(self, board_1, board_2, show_opponent_board = False):
    #     fmt = '{:^' + str(board_1.size*2 - 1) + '}'
    #     print('\n'+fmt.format(board_1.owner) + ' '*8 + fmt.format(board_2.owner))
    #     headers = ' '.join([string.ascii_letters[i].upper() for i in range(board_1.size)])
    #     print(headers + ' '*8 + headers)
    #     board_pc = board_2.board if show_opponent_board else [['.'] * board_2.size for _ in range(board_2.size)]
    #     for idx, (row1, row2) in enumerate(zip(board_1.board, board_pc)):
    #             print(' '.join(row1) + '   %2d   ' %(idx+1) + ' '.join(row2))
    #     print()

    def print_boards(self, board_1, board_2, show_opponent_board = False):
        def hide_char(char):
            return '.'

        fmt = '{:^' + str(board_1.size*2 - 1) + '}'
        print('\n'+fmt.format(board_1.owner) + ' '*8 + fmt.format(board_2.owner))
        headers = ' '.join([string.ascii_letters[i].upper() for i in range(board_1.size)])
        print(headers + ' '*8 + headers)
        board_pc = [[hide_char(i) for i in row] for row in board_2.board]
        for idx, (row1, row2, row3) in enumerate(zip(board_1.board, board_2.board, board_pc)):
                print(' '.join(row1) + '   %2d   ' %(idx+1) + ' '.join(row2)+ '   %2d   ' %(idx+1) + ' '.join(row3))
        print()

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

    def initialize(self, debug_info = False):
        user_board, pc_board = self.initialize_boards()
        user_navy, pc_navy = self.navy
        if not (self.place_navy(user_board, user_navy) and self.place_navy(pc_board, pc_navy)):
            raise EnvironmentError("Error occurred during navy placing")
        self.print_boards(user_board, pc_board, debug_info)

    def ask_user(self):
        """
        Function returns cell in format {Letter: 1s} + {Digit: 2d}
        """
        size = self.board_size
        is_cell_correct = False
        while not is_cell_correct:
            try:
                user_input = input("Enter cell in LetterNumber format (i.e. A8) ")
                x = user_input[0].upper()
                y = int(user_input[1:])
                if not (x in string.ascii_uppercase[:size] and y in range(1, size + 1)):
                    print("Incorrect cell specified. Please, try again")
                    continue
                else:
                    is_cell_correct = True
            except ValueError:
                print("Incorrect cell specified. Please, try again")
        return (string.ascii_uppercase.index(x), y - 1)

    def ask_pc(self):
        x = random.randint(0,self.user_board.size)
        y = random.randint(0,self.user_board.size)
        return (x,y)


    def start(self):
        pass







