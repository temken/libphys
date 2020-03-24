
#Compiler and compiler flags
CXX := g++
CXXFLAGS := -Wall -std=c++11 
LIB := 
INC := -I include

#Directories
SRCDIR := src
BUILDDIR := build
TARGETDIR := bin

#Targets
TARGET = $(TARGETDIR)/libphys_test

#Source files
SRCEXT := cpp
SRC := $(shell find $(SRCDIR) -type f -name '*.$(SRCEXT)')

#Object files
OBJ := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SRC:.$(SRCEXT)=.o))


.PHONY: all clean test


all: CXXFLAGS += -O2 
all: $(TARGET)

test: LIB+= --coverage
test: $(TARGET)


$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) $(LIB) $(INC) -o $@ $^ 

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	$(CXX) $(CXXFLAGS) $(LIB) $(INC) -o $@ -c $<


clean:
	find . -type f -name '*.o' -delete
	find . -type f -name '*.gcno' -delete
	find . -type f -name '*.gcda' -delete
	find . -type f -name '*.gcov' -delete
	rm -f $(TARGET)
