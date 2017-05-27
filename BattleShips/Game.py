from Helper import Game

new_game = Game()
user_board, pc_board = new_game.initialize_boards()
user_navy, pc_navy = new_game.initialize_navy()
new_game.place_navy(user_board, user_navy)
new_game.place_navy(pc_board, pc_navy)
