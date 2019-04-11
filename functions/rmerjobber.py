import sys

def main(*argv, **kwargs):
    count = 0
    found_id = 0
    reading_read = []
    with open(kwargs.get('fi', None), 'r') as fi:
        for line in fi.readlines():
            if kwargs.get('id', None) in line:
                del reading_read[count-1]
                found_id = count
            elif not found_id or found_id + 7 <= count:
                reading_read.append(line)
            count += 1

    with open(kwargs.get('fo', None), 'w') as fo:
        for line in reading_read:
            fo.write(line)

if __name__ == '__main__':
    if '-i' in sys.argv:
        fi = sys.argv[sys.argv.index('-i') + 1]
    else:
        raise Exception('No input')
    if '-o' in sys.argv:
        fo = sys.argv[sys.argv.index('-o') + 1]
    else:
        raise Exception('No Output')
    if '-d' in sys.argv:
        id = sys.argv[sys.argv.index('-d') + 1]
    else:
        raise Exception('No id')
    print("""
        fi: %s
        fo: %s
        id: %s""" %(fi,fo,id))
    main(fi=fi, fo=fo, id=id)


#- name: AboutToGoHome
#  id: 1235dfdsfdserewr
#  cmd: fish -c "alert -t 'Klokken er 15.35' -m 'Glem Ej Stefan' -u 'critical' -b"
#  time: '0 35 15 * * 1-5'
#  onError: Continue
#  notifyOnError: false
#  notifyOnFailure: false
#  notifyOnSucess: false
