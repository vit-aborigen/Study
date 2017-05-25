class Ship():
    def __init__(self, size, left_top_corner, direction):
        self.position = left_top_corner
        self.direction = direction
        self.size = size
        self.isSunk = False

    def getStatus(self):
        return self.isSunk

    def setStatus(self, cell):
        self.cell = 0

    def __str__(self):
        result = []
        for i in self.size:
            return []*4



