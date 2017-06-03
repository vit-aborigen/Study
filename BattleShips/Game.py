from Helper import Game

new_game = Game()
res = new_game.start()
if res: print("PC won")
else: print("User won")