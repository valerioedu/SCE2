echo "SCE Editor Build Script"
echo "======================="

detect_package_manager() {
    if command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v apt &> /dev/null; then
        echo "apt"
    else
        echo "unknown"
    fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then    
    echo "Checking dependencies..."
    if ! command -v cmake &> /dev/null; then
        echo "Installing cmake..."
        brew install cmake
    fi

    if ! command -v pkg-config &> /dev/null; then
        echo "Installing pkg-config..."
        brew install pkg-config
    fi
    
    brew install ncurses
else
    PKG_MANAGER=$(detect_package_manager)
    echo "Using package manager: $PKG_MANAGER"
    
    case $PKG_MANAGER in
        "pacman")
            echo "Checking dependencies..."
            if ! command -v cmake &> /dev/null; then
                echo "Installing cmake..."
                sudo pacman -S --noconfirm cmake
            fi

            if ! command -v pkg-config &> /dev/null; then
                echo "Installing pkg-config..."
                sudo pacman -S --noconfirm pkg-config
            fi
            
            if ! pkg-config --exists ncurses; then
                echo "Installing ncurses development library..."
                sudo pacman -S --noconfirm ncurses
            fi
            ;;
            
        "dnf")
            echo "Checking dependencies..."
            if ! command -v cmake &> /dev/null; then
                echo "Installing cmake..."
                sudo dnf install -y cmake
            fi

            if ! command -v pkg-config &> /dev/null; then
                echo "Installing pkg-config..."
                sudo dnf install -y pkgconfig
            fi
            
            if ! pkg-config --exists ncurses; then
                echo "Installing ncurses development library..."
                sudo dnf install -y ncurses-devel
            fi
            ;;
            
        "apt")
            echo "Checking dependencies..."
            if ! command -v cmake &> /dev/null; then
                echo "Installing cmake..."
                sudo apt install -y cmake
            fi

            if ! command -v pkg-config &> /dev/null; then
                echo "Installing pkg-config..."
                sudo apt install -y pkg-config
            fi
            
            if ! pkg-config --exists ncurses; then
                echo "Installing ncurses development library..."
                sudo apt install -y libncurses-dev
            fi
            ;;
            
        *)
            echo "Unsupported package manager. Please install these dependencies manually:"
            echo "- cmake"
            echo "- pkg-config"
            echo "- ncurses development library"
            exit 1
            ;;
    esac
fi

echo "Setting up build directory..."
mkdir -p build
cd build

echo "Configuring project..."
cmake ..

echo "Building project..."
make

echo "Installing SCE editor..."
sudo make install

echo "Installation complete! You can now run SCE from the command line."