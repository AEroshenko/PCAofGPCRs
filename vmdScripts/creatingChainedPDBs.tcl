
proc create1chainedPDB {pdb_id chain_id out_id} {

  mol new $pdb_id
  set sel [atomselect top " protein and chain $chain_id " ]
  $sel writepdb $out_id
  mol delete top

}

#proc createChainedPDBs {pdb_ids pdb_chains pdb_outs} {
proc createChainedPDBs {} {
  set pathToProject "/media/my_extra_space/projects/1510GPCR/"

  set pathToChainedPdbs "pdbs/chained/"
  set pathToChainedPdbs $pathToProject$pathToChainedPdbs
  set pathToOriginalPdbs "pdbs/original/"
  set pathToOriginalPdbs $pathToProject$pathToOriginalPdbs

  set pdb_ids "datFiles/idsNamesToChain.dat"
  set pdb_ids $pathToProject$pdb_ids
  set pdb_chains "datFiles/chainNamesToChain.dat"
  set pdb_chains $pathToProject$pdb_chains
  set pdb_outs "datFiles/outNamesAfterChaining.dat"
  set pdb_outs $pathToProject$pdb_outs
  set ids [readfile $pdb_ids]
  set chains [readfile $pdb_chains]
  set outs [readfile $pdb_outs]
  set l [llength $ids]
  
  for {set j 0} {$j < $l} {incr j} {
      create1chainedPDB "$pathToOriginalPdbs[lindex $ids $j]" [lindex $chains $j] "$pathToChainedPdbs[lindex $outs $j]"
  }

}

proc readfile filename {
   set f [open $filename]
   set data [read $f]
   close $f
   return $data
}
