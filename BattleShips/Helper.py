from Ship import Ship
from Board import Board
import string, random, copy

class Game():
    def __init__(self):
        self.board_size, self.max_ship_size = self.get_data_from_user()
        self.user_navy, self.pc_navy = self.initialize_navy()
        self.user_board, self.pc_board = self.initialize_boards()
        is_user_placed = self.place_navy(self.user_board, self.user_navy)
        is_pc_placed = self.place_navy(self.pc_board, self.pc_navy)
        if not (is_user_placed and is_pc_placed):
            raise EnvironmentError("Error occurred during navy placing")

    def get_data_from_user(self):
        board_set, ships_set = False, False

        #get user values for board and ships
        while not board_set:
            board_size = input("Enter board size (5-20): ")
            try:
                board_size = int(board_size)
                if board_size not in range(5, 21):
                    print("Board size is incorrect. Please, try again. ", end='')
                    continue
                board_set = True
            except ValueError:
                print("Value should be integer")

        while not ships_set:
            max_ship_size = input("Enter largest ship size (1-%s): " % (str(min(board_size//2, 8))))
            try:
                max_ship_size = int(max_ship_size)
                if max_ship_size not in range(1, 9) or max_ship_size > board_size//2:
                    print("Ship size is incorrect. Please, try again. ", end='')
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
        def hide_char(char):
            if char in '1234567890': return '.'
            return char

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
        return navy, copy.deepcopy(navy)

    def place_navy(self, board: Board, navy):
        are_ships_placed = False
        while not are_ships_placed:
            placing_result = True
            for ship in navy:
                placing_result = board.add_ship(ship)
                if not placing_result:
                    board.board = board.build()
                    for ship in navy:
                        ship.reset_cells()
                    break
            if placing_result:
                return True
        return False

    def interact_with_player(self, board):
        """
        :param board:
        :return: 0 - mis, 1 - hit, 2 - kill
        """

        def ask_user(size):
            """
            Function returns cell in format {Letter: 1s} + {Digit: 2d}
            """
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
                except (ValueError, IndexError):
                    print("Incorrect cell specified. Please, try again")
            return (string.ascii_uppercase.index(x), y - 1)

        def ask_pc(size):
            x = random.randint(0,size-1)
            y = random.randint(0,size-1)
            return (x,y)

        cell = ask_user(self.board_size) if board.owner == "Computer" else ask_pc(self.board_size)
        owner = "Computer" if board.owner == "Player" else "Player"

        if board.check_cell(cell):
            if self.find_ship(cell, owner) == 1 or 2:
                print(owner + ": hit! " + str(cell))
                return 1
        else:
            print(owner + ": mis " + str(cell))
            return 0

    def find_ship(self, cell, owner):
        navy = self.pc_navy if owner == "Computer" else self.user_navy
        for ship in navy:
            if cell in ship.get_cells():
                ship.hit(cell)
                print("Ship " + str(ship.get_cells()))
                return 1
        return 2



    def start(self):
        turn = 0
        while self.user_board.count_ship_cells() and self.pc_board.count_ship_cells():
            print("\nTurn: ", turn)
            self.print_boards(self.user_board, self.pc_board)
            if self.interact_with_player(self.pc_board): continue
            if self.interact_with_player(self.user_board): continue
            turn += 1

        if not self.user_board.count_ship_cells():
            return 1
        return 0