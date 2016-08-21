#
# Makefile to compile eos functions
#

FILM_FILE = FILM_NULL.f
EOS_FILE = EOS.f

FILM_OBJ = film_null.o
EOS_OBJ = EOS.o

# Parameters for windows using cygwin
F90C = gfortran
F77C = gfortran
ABQINCDIR = /cygdrive/c/SIMULIA/Abaqus/6.14-2/SMA/site/
F90FLAGS = -w -fPIC -O3 -I$(ABQINCDIR)
F77FLAGS = -w -fPIC -O3 -I$(ABQINCDIR)

ABQCMD = /cygdrive/c/SIMULIA/Abaqus/Commands/abaqus

# Parameters for hpc.utep.edu
#F90C = gfortran
#ABQINCDIR = /shared/abaqus/6.11-2/site/
#F90FLAGS = -w -fPIC -O3 -I$(ABQINCDIR)
#DFLUX_OBJ = dflux.o
#ABQCMD = /shared/abaqus/Commands/abaqus

#test: dflux test.f90
#	$(F90C) $(F90FLAGS) -o test $(DFLUX_OBJ) test.f90
	
film:
	$(F77C) $(F77FLAGS) -c $(FILM_FILE) -o $(FILM_OBJ)
	
eos:
	$(F77C) $(F77FLAGS) -c $(EOS_FILE) -o $(EOS_OBJ)
	
plate:
	$(ABQCMD) job=plate user=$(FILM_OBJ) interactive

props:
	$(F90C) -c lookup_mod.f90 o2props_mod.f90 driver.f90 
	$(F90C) -o driver.exe lookup_mod.o o2props_mod.o driver.o
	
clean:
	rm -f *.o *.mod *.exe
