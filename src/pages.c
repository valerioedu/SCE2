#include "pages.h"

void display_help() {
    int row, col;
    getmaxyx(stdscr, row, col);
    row = row / 2;
    col = col / 2;
    int start = col - strlen("press:   F1   for instructions about filesystem") / 2;
    mvprintw(row - 1, start, "press:   F1   for instructions about filesystem");
    mvprintw(row, start, "press:   F2   for instructions about macros");
    mvprintw(row + 1, start, "press:   esc   to exit");
    mvprintw(row + 3, start, "run:     SCE uninstall   to delete SCE");
    int c = getch();
    if (c == ESCAPE) refresh();
}

void display_info() {
    int row, col;
    getmaxyx(stdscr, row, col);
    row = row / 2;
    col = col / 2;
    int start = col - (strlen("press:   F1\t for instructions") + 6) / 2;
    mvprintw(row - 5, col - strlen("Info") / 2, "Info");
    mvprintw(row - 3, start, "press:   F1\t\t for instructions");
    mvprintw(row -2, start, "press:   F2\t\t to display this page");
    mvprintw(row - 1 , start, "press:   F3\t\t for the file explorer");
    mvprintw(row + 3, start, "press:   esc\t\t to exit");
    mvprintw(row , start, "press:   F4\t\t to save file");
    mvprintw(row + 1, start, "press:   F7\t\t for the git page");
    mvprintw(row + 2, start, "press:   F9\t\t to open the command input");
    mvprintw(row + 5, col - strlen("Press any key to continue...") / 2, "Press any key to continue...");
    refresh();
    char c = getch();
}

char file_display() {
    clear();
    int maxrows, maxcols;
    getmaxyx(stdscr, maxrows, maxcols);
    int row, col;
    row = maxrows / 2;
    col = maxcols / 2;
    mvprintw(row - 2, col - strlen("File explorer") / 2, "File Explorer");
    mvprintw(row, col - strlen("press:   S      to save") / 2, "Press:   S      to save");
    mvprintw(row + 1, col - strlen("press:   L      to load") / 2, "Press:   L      to load");
    mvprintw(row + 3, col - strlen("Press any key to continue...") / 2, "Press any key to continue...");
    refresh();
    char c = getch();
    return c;
}