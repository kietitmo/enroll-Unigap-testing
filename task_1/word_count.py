import argparse
import json

def word_count(text):
    for char in '_-.,\n!?\t)([])':
        text=text.replace(char,' ')
        text = text.lower()
    word_list = text.split()
    print(word_list)

    wordfreq = {}
    for word in word_list:
            wordfreq[word] = wordfreq.setdefault(word, 0) + 1

    return wordfreq

# dung de quy
def create_file(n, result):
    if n > 100:
        return
    
    filename = f"./task_1/results/result_{n}.json"
    with open(filename, 'w') as f:
        json.dump(result, f)
    
    create_file(n + 1, result)

parser = argparse.ArgumentParser()
parser.add_argument('text', type=str, help='text')
args = parser.parse_args()

wordfreq= word_count(args.text)

create_file(1, wordfreq)


