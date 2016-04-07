### create1PDB 4PHU_A.pdb 4PHU_Ares.dat
proc create1PDB {pdb_id pathToProject} {

  set pathToChainedPdbs "pdbs/chained/"
  set pathToChainedPdbs $pathToProject$pathToChainedPdbs
  set pathToGlycinePdbs "pdbs/glycine/"
  set pathToGlycinePdbs $pathToProject$pathToGlycinePdbs
  set pathToResFiles "datFiles/resLists/"
  set pathToResFiles $pathToProject$pathToResFiles

  set pdbEnding ".pdb"
  set resDatEnding "res.dat"
  set glyEnding "gly.pdb"
  mol load pdb $pathToChainedPdbs$pdb_id$pdbEnding
  set residues [readfile $pathToResFiles$pdb_id$resDatEnding]

  set selCA [atomselect top "name CA and altloc \"\" A and resid $residues"]
  set selBB [atomselect top "backbone and altloc \"\" A and resid $residues"]
  set i 0
  foreach resid [$selCA get resid] {
        incr i
        set sel_res [atomselect top "backbone and resid $resid"]
        $sel_res set resname GLY
	$sel_res set resid $i
        $sel_res set chain A
  }
  $selBB writepdb $pathToGlycinePdbs$pdb_id$glyEnding

  mol delete top

}

proc loadPDBvec {} {

  set pathToProject "/media/my_extra_space/projects/1510GPCR/"

  set pdb_in_ids "datFiles/listOfAClassesIdsForPCA.dat"
  set pdb_in_ids $pathToProject$pdb_in_ids

  set ids [readfile $pdb_in_ids]
  set l [llength $ids]

  for {set j 0} {$j < $l} {incr j} {
      create1PDB [lindex $ids $j] $pathToProject
  }

}

proc readfile filename {
   set f [open $filename]
   set data [read $f]
   close $f
   return $data
}

