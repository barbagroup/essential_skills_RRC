happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print(counts)
