# Program name / final executable name
NAME = Nexaris

# Compiler used to compile C++ files
CC = c++

# Compiler flags:
# -Wall enables common warnings
# -Wextra enables extra warnings
# -Werror treats warnings as errors

CFLAGS = -Wall -Werror -Wextra

# Directory containing source files

SRCDIR = srcs

# Directory containing header files

INCDIR = includes

# Directory where object files will be stored

OBJDIR = objs

# List of source files used by the project

SRCS_FILES= main.cpp

#To make everything more intelligent instead of to repeat using a lot of SRCDIR as a prefix

SRCS = $(addprefix $(SRCDIR)/, $(SRCS_FILES))

# Convert each source file path into an object file path
# Example:
# srcs/main.cpp -> objs/main.o

OBJS = $(SRCS:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)

# Default rule executed when running "make"
# It builds the final executable

all: $(NAME)

# Rule to create the final executable
# It links all object files into the program

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -I $(INCDIR) -o $(NAME) $(OBJS)

# Rule to compile each .cpp file into a .o file
# $< means the source file
# $@ means the target object file

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

# Remove object files and the object directory

clean:
	rm -rf $(OBJDIR)

# Remove object files and the final executable

fclean: clean
	rm -rf $(NAME)

# Rebuild the project from zero

re: fclean all

# Declare rules that are not real files

.PHONY: all clean fclean re
