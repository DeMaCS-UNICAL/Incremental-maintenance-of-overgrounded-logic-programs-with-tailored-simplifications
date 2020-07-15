# _I<sup>2</sup>-DLV_

# LIST OF FOLDERS AND FILES contained in the `idlv_incremental.zip` archive

 * **`idlv-incremental`** folder containing all the necessary libraries and script to execute _I<sup>2</sup>-DLV_.
 
 * **`solver`** folder contains the binaries of `dlv2` and `clingo5.4`.
 
 * **`test`** folder contains a simple example for testing _I<sup>2</sup>-DLV_.
   * `recursion/recursion.*.asp`: ASP files given in input to _I<sup>2</sup>-DLV_.
   * `disjunction/disjunction.*.asp`: ASP files given in input to _I<sup>2</sup>-DLV_.
   * `template.xml`: it is an XML file containing all the instructions that have to be executed by _I<sup>2</sup>-DLV_.

 * **`ICLP2020_benchmarks`** folder contains a a series of benchmarks executed for ICLP2020 Conference.
   * `mmedia/`: contains encoding and input fact of the Content Caching test.
   * `pacman/`: contains encoding and input fact of the Pacman test.
   * `mmedia.xml`: it is an XML file containing all the instructions that have to be executed by _I<sup>2</sup>-DLV_ for running the `mmedia` experiment.
   * `pacman.xml`: it is an XML file containing all the instructions that have to be executed by _I<sup>2</sup>-DLV_ for running the `pacman` experiment.

# HOW TO RUN THE EXPERIMENTS
First of all you need to unzip the `idlv_incremental.zip` archive move and, then, you have to move in the ICLP2020 benchmarks folder. Run the shell command
  * `cd ./idlv-incremental/ICLP2020_benchmarks`

You can run all the tests using the I<sup>2</sup>-DLV version with or without the simplification/desimplification steps. If you want to test the performance of the system **with** the simplification/desimplification steps, you need to pass as argument of the executable the option `--isd` followed by the option `--istats=1` to get also some statistics overview.
  * `../idlv-incremental/i2dlv --isd --istats=1 < file.xml`

If you want to test the basic version of I<sup>2</sup>-DLV (**without** the simplification/desimplification steps), just run the same command as before without the `--isd` option
  * `../idlv-incremental/i2dlv --istats=1 < file.xml`

 

## PACMAN BENCHMARK
Pacman benchmark can be run with different pacman visibility horizon. You can change the visibility horizon simply running the script `updatePacmanHorizon.sh`. The horizon can be specified through an ARGV paramenter that can be 10,20 or 30 depending from the value you want to set.
  * `./updatePacmanHorizon.sh [VALUE]` 

Pacman benchmark can be run by passing to I<sup>2</sup>-DLV the input file `pacman.xml`. The system will produce in output a series of ground programs stored in the folder `pacman/pacman_ground`. Each ground program correspond to a next shot repeted over the knowledge base with a new set of input fact.
  * `../idlv-incremental/i2dlv --isd --istats=1 < pacman.xml`

Each ground program produced can be solved using one of the solver provided in this suite (`dlv2` or `clingo5.4`).
  * `../solver/dlv2 --mode=wasp < pacman/pacman_ground/shot.X`

or

  * `../solver/clingo5.4 --mode=clasp pacman/pacman_ground/shot.X`


## MMEDIA BENCHMARK
Mmedia benchmark can be run by passing to I<sup>2</sup>-DLV the input file `mmedia.xml`. The system will produce in output a series of ground programs stored in the folder `mmedia/mmedia_ground`. Each ground program correspond to a next shot repeted over the knowledge base with a new set of input fact.
  * `../idlv-incremental/i2dlv --isd --istats=1 < mmedia.xml`

Each ground program produced can be solved using one of the solver provided in this suite (`dlv2` or `clingo5.4`).
  * `../solver/dlv2 --mode=wasp < mmedia/mmedia_ground/shot.X`

or

  * `../solver/clingo5.4 --mode=clasp mmedia/mmedia_ground/shot.X`

