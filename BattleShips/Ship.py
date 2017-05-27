class Ship():
    def __init__(self, size):
        self.size = size
        self.status = ['0']*size

    def getStatus(self):
        return self.status

    def hit(self, cell):
        self.status[cell] = 'X'

    def __str__(self):
        if all(ch == '0' for ch in self.status):
            result = "x Full "
        elif all(ch == 'X' for ch in self.status):
            result = "x Dead "
        else:
            result = "x Injured "
        return "Size: " + str(self.size) + result + ''.join(self.status)

test_ship = Ship(3)
test_ship.hit(2)
print(test_ship)


