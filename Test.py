class Test(object):

    remembered_word = ''
    number = 0

    def print_word(self, word):
        print(word)

    def set_word(self, word):
        self.remembered_word = word

    def word_should_be(self, word):
        if word != self.remembered_word:
            raise AssertionError('%sual isn\'t eq %s' % (word, self.remembered_word))

    def set_number(self, number):
        self.number = int(number)

    def plus_number(self, number):
        self.number = int(self.number) + int(number)

    def number_should_be(self, number):
        if int(number) != self.number:
            raise AssertionError(f'{number} != {self.number}')