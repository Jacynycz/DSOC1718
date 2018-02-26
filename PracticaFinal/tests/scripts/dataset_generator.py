import sha3
import string
import random
import sys

def id_generator(min,max):
    chars=string.ascii_uppercase + string.digits + string.ascii_lowercase + " ()"
    size = random.randint(min, max)
    return ''.join(random.choice(chars) for _ in range(size))

args = sys.argv
if len(args) == 4:

    for x in range(0,int(args[1])):
        k = sha3.keccak_512()
        s = id_generator(int(args[2]),int(args[3])).strip()
        k.update(s)
        print(s+ "\n" +k.hexdigest())
else:
    print "USAGE:\n\npython2 dataset_generator.py [num_of_strings] [min_length] [max_length] > ../dataset_random.txt\n\n"