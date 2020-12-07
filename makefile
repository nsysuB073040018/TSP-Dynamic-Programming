CPP = g++
F = -Wall -std=c++17
F_PLOT = -DPLOT=0 # plot or not
VPATH = ./lib/ #search directory
EXEC = search
OBJ = city.o dp.o
OBJDIR = ./obj/
EXECOBJ = $(addprefix $(OBJDIR), $(EXEC).o)
OBJS = $(addprefix $(OBJDIR), $(OBJ))

all: clean dep link

dep: $(OBJDIR) $(OBJS)

link: $(EXECOBJ)
	$(CPP) $(F) $(EXECOBJ) $(OBJS) -o $(EXEC)

$(OBJDIR):
	mkdir obj

$(EXECOBJ): $(EXEC).cpp
	$(CPP) $(F_PLOT) $(F) -c $< -o $@

$(OBJDIR)%.o: %.cpp
	$(CPP) $(F) -c $< -o $@

clean:
	rm -rf obj $(EXEC)
