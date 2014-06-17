TARGET		= glcubes
CC		= clang++
CFLAGS		= -std=c++11 -stdlib=libc++ -Wall -I. -g

LINKER		= clang++ -o
LFLAGS		= -Wall -I. -lm

SRCDIR		= src
OBJDIR		= obj
BINDIR		= .

SOURCES		:= $(wildcard $(SRCDIR)/*.cc)
INCLUDES	:= $(wildcard $(SRCDIR)/*.h)
OBJECTS		:= $(SOURCES:$(SRCDIR)%.cc=$(OBJDIR)/%.o)
rm			= rm -f

all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(OBJECTS)
	@$(LINKER) $@ $(LFLAGS) $(OBJECTS)

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.cc
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONEY: clean
clean:
	@$(rm) $(OBJECTS) $(BINDIR)/$(TARGET)

.PHONEY: remove
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
