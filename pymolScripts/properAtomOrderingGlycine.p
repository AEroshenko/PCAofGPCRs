reinitialize

python
pathToProject='/media/my_extra_space/projects/1510GPCR/'
pathToGlycines=pathToProject+'pdbs/glycine/'
fileNamesFile=pathToProject+'datFiles/listOfAClassesIdsForPCA.dat'


list_m = [line.rstrip('\n') for line in open(fileNamesFile)]
total = len(list_m)

for i in range(total):
    cmd.load(pathToGlycines+"%sgly.pdb" % (list_m[i]))
    cmd.save(pathToGlycines+list_m[i]+'ordered.pdb',list_m[i]+'gly')

python end
