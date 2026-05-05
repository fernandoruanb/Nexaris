# Program name / project name

NAME = miniERP

# .NET command line tool

DOTNET = dotnet

# C# project file

PROJECT = $(NAME).csproj

# Build configuration

CONFIG = Debug

# Publish output directory

PUBLISH_DIR = publish

# Default rule executed when running "make"

all: build

# Restore dependencies

restore:
	$(DOTNET) restore $(PROJECT)

# Build the project
# The .csproj automatically includes all .cs files in the project folder

build: restore
	$(DOTNET) build $(PROJECT) -c $(CONFIG) -p:TreatWarningsAsErrors=true

# Run the program

run:
	$(DOTNET) run --project $(PROJECT)

# Build and run the program

exec: build
	$(DOTNET) run --project $(PROJECT)

# Publish release version

publish:
	$(DOTNET) publish $(PROJECT) -c Release -o $(PUBLISH_DIR)

# Clean generated build files

clean:
	$(DOTNET) clean $(PROJECT)
	rm -rf bin obj

# Full clean

fclean: clean
	rm -rf $(PUBLISH_DIR)

# Rebuild from zero

re: fclean all

.PHONY: all restore build run exec publish clean fclean re
