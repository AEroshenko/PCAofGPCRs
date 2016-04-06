reinitialize

python
pathToProject='/media/my_extra_space/projects/1510GPCR/'
pathToChains=pathToProject+'pdbs/chained/'
pathToDatFiles=pathToProject+'datFiles/'

cmd.load(pathToChains+"1F88_A.pdb")
python end

sel sel0, 1F88_A and resi 34-64+71-100+107-139+150-173+200-225+244-277+286-309

python
list_m = [line.rstrip('\n') for line in open(pathToDatFiles+"unassignedPdbs.dat")]
total = len(list_m)

for i in range(total):
    cmd.load(pathToChains+"%s.pdb" % (list_m[i]))
    cmd.super(list_m[i],"sel0")

python end
