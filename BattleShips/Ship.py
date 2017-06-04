class Ship():
    #USELESS. Only ship.size is worthy
    def __init__(self, size):
        self.size = size
        self.status = ['0']*size

    def get_size(self):
        return self.size

    def get_status(self):
        return self.status

    def __str__(self):
        if all(ch == '0' for ch in self.status):
            result = "x Full "
        elif all(ch == 'X' for ch in self.status):
            result = "x Dead "
        else:
            result = "x Injured "
        return "Size: " + str(self.size) + result + ''.join(self.status)