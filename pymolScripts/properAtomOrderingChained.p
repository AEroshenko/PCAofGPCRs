reinitialize

python
pathToProject='/media/my_extra_space/projects/1510GPCR/'
pathToChained=pathToProject+'pdbs/chained/'
fileNamesFile=pathToProject+'datFiles/listOfAClassesIdsForPCA.dat'


list_m = [line.rstrip('\n') for line in open(fileNamesFile)]
total = len(list_m)

for i in range(total):
    cmd.load(pathToChained+"%s.pdb" % (list_m[i]))
    cmd.save(pathToChained+list_m[i]+'ordered.pdb',list_m[i])

python end
