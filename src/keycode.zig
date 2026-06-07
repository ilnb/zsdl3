// SDL3 Keycode and Scancode Bindings
// Complete key mappings and constants

const core = @import("core.zig");

// Keycode and scancode types
pub const Keycode = core.Keycode;
pub const Scancode = core.Scancode;

// === SDL Scan codes ===
// These values are from usage page 0x07 (USB keyboard page)
pub const SCANCODE_UNKNOWN = 0;

// Usage page 0x07
pub const SCANCODE_A = 4;
pub const SCANCODE_B = 5;
pub const SCANCODE_C = 6;
pub const SCANCODE_D = 7;
pub const SCANCODE_E = 8;
pub const SCANCODE_F = 9;
pub const SCANCODE_G = 10;
pub const SCANCODE_H = 11;
pub const SCANCODE_I = 12;
pub const SCANCODE_J = 13;
pub const SCANCODE_K = 14;
pub const SCANCODE_L = 15;
pub const SCANCODE_M = 16;
pub const SCANCODE_N = 17;
pub const SCANCODE_O = 18;
pub const SCANCODE_P = 19;
pub const SCANCODE_Q = 20;
pub const SCANCODE_R = 21;
pub const SCANCODE_S = 22;
pub const SCANCODE_T = 23;
pub const SCANCODE_U = 24;
pub const SCANCODE_V = 25;
pub const SCANCODE_W = 26;
pub const SCANCODE_X = 27;
pub const SCANCODE_Y = 28;
pub const SCANCODE_Z = 29;

pub const SCANCODE_1 = 30;
pub const SCANCODE_2 = 31;
pub const SCANCODE_3 = 32;
pub const SCANCODE_4 = 33;
pub const SCANCODE_5 = 34;
pub const SCANCODE_6 = 35;
pub const SCANCODE_7 = 36;
pub const SCANCODE_8 = 37;
pub const SCANCODE_9 = 38;
pub const SCANCODE_0 = 39;

pub const SCANCODE_RETURN = 40;
pub const SCANCODE_ESCAPE = 41;
pub const SCANCODE_BACKSPACE = 42;
pub const SCANCODE_TAB = 43;
pub const SCANCODE_SPACE = 44;

pub const SCANCODE_MINUS = 45;
pub const SCANCODE_EQUALS = 46;
pub const SCANCODE_LEFTBRACKET = 47;
pub const SCANCODE_RIGHTBRACKET = 48;
pub const SCANCODE_BACKSLASH = 49;
pub const SCANCODE_NONUSHASH = 50;
pub const SCANCODE_SEMICOLON = 51;
pub const SCANCODE_APOSTROPHE = 52;
pub const SCANCODE_GRAVE = 53;
pub const SCANCODE_COMMA = 54;
pub const SCANCODE_PERIOD = 55;
pub const SCANCODE_SLASH = 56;

pub const SCANCODE_CAPSLOCK = 57;

pub const SCANCODE_F1 = 58;
pub const SCANCODE_F2 = 59;
pub const SCANCODE_F3 = 60;
pub const SCANCODE_F4 = 61;
pub const SCANCODE_F5 = 62;
pub const SCANCODE_F6 = 63;
pub const SCANCODE_F7 = 64;
pub const SCANCODE_F8 = 65;
pub const SCANCODE_F9 = 66;
pub const SCANCODE_F10 = 67;
pub const SCANCODE_F11 = 68;
pub const SCANCODE_F12 = 69;

pub const SCANCODE_PRINTSCREEN = 70;
pub const SCANCODE_SCROLLLOCK = 71;
pub const SCANCODE_PAUSE = 72;
pub const SCANCODE_INSERT = 73;
pub const SCANCODE_HOME = 74;
pub const SCANCODE_PAGEUP = 75;
pub const SCANCODE_DELETE = 76;
pub const SCANCODE_END = 77;
pub const SCANCODE_PAGEDOWN = 78;
pub const SCANCODE_RIGHT = 79;
pub const SCANCODE_LEFT = 80;
pub const SCANCODE_DOWN = 81;
pub const SCANCODE_UP = 82;

pub const SCANCODE_NUMLOCKCLEAR = 83;
pub const SCANCODE_KP_DIVIDE = 84;
pub const SCANCODE_KP_MULTIPLY = 85;
pub const SCANCODE_KP_MINUS = 86;
pub const SCANCODE_KP_PLUS = 87;
pub const SCANCODE_KP_ENTER = 88;
pub const SCANCODE_KP_1 = 89;
pub const SCANCODE_KP_2 = 90;
pub const SCANCODE_KP_3 = 91;
pub const SCANCODE_KP_4 = 92;
pub const SCANCODE_KP_5 = 93;
pub const SCANCODE_KP_6 = 94;
pub const SCANCODE_KP_7 = 95;
pub const SCANCODE_KP_8 = 96;
pub const SCANCODE_KP_9 = 97;
pub const SCANCODE_KP_0 = 98;
pub const SCANCODE_KP_PERIOD = 99;

pub const SCANCODE_NONUSBACKSLASH = 100;
pub const SCANCODE_APPLICATION = 101;
pub const SCANCODE_POWER = 102;
pub const SCANCODE_KP_EQUALS = 103;
pub const SCANCODE_F13 = 104;
pub const SCANCODE_F14 = 105;
pub const SCANCODE_F15 = 106;
pub const SCANCODE_F16 = 107;
pub const SCANCODE_F17 = 108;
pub const SCANCODE_F18 = 109;
pub const SCANCODE_F19 = 110;
pub const SCANCODE_F20 = 111;
pub const SCANCODE_F21 = 112;
pub const SCANCODE_F22 = 113;
pub const SCANCODE_F23 = 114;
pub const SCANCODE_F24 = 115;

pub const SCANCODE_EXECUTE = 116;
pub const SCANCODE_HELP = 117;
pub const SCANCODE_MENU = 118;
pub const SCANCODE_SELECT = 119;
pub const SCANCODE_STOP = 120;
pub const SCANCODE_AGAIN = 121;
pub const SCANCODE_UNDO = 122;
pub const SCANCODE_CUT = 123;
pub const SCANCODE_COPY = 124;
pub const SCANCODE_PASTE = 125;
pub const SCANCODE_FIND = 126;
pub const SCANCODE_MUTE = 127;
pub const SCANCODE_VOLUMEUP = 128;
pub const SCANCODE_VOLUMEDOWN = 129;

pub const SCANCODE_KP_COMMA = 133;
pub const SCANCODE_KP_EQUALSAS400 = 134;

pub const SCANCODE_INTERNATIONAL1 = 135;
pub const SCANCODE_INTERNATIONAL2 = 136;
pub const SCANCODE_INTERNATIONAL3 = 137;
pub const SCANCODE_INTERNATIONAL4 = 138;
pub const SCANCODE_INTERNATIONAL5 = 139;
pub const SCANCODE_INTERNATIONAL6 = 140;
pub const SCANCODE_INTERNATIONAL7 = 141;
pub const SCANCODE_INTERNATIONAL8 = 142;
pub const SCANCODE_INTERNATIONAL9 = 143;
pub const SCANCODE_LANG1 = 144;
pub const SCANCODE_LANG2 = 145;
pub const SCANCODE_LANG3 = 146;
pub const SCANCODE_LANG4 = 147;
pub const SCANCODE_LANG5 = 148;
pub const SCANCODE_LANG6 = 149;
pub const SCANCODE_LANG7 = 150;
pub const SCANCODE_LANG8 = 151;
pub const SCANCODE_LANG9 = 152;

pub const SCANCODE_ALTERASE = 153;
pub const SCANCODE_SYSREQ = 154;
pub const SCANCODE_CANCEL = 155;
pub const SCANCODE_CLEAR = 156;
pub const SCANCODE_PRIOR = 157;
pub const SCANCODE_RETURN2 = 158;
pub const SCANCODE_SEPARATOR = 159;
pub const SCANCODE_OUT = 160;
pub const SCANCODE_OPER = 161;
pub const SCANCODE_CLEARAGAIN = 162;
pub const SCANCODE_CRSEL = 163;
pub const SCANCODE_EXSEL = 164;

pub const SCANCODE_KP_00 = 176;
pub const SCANCODE_KP_000 = 177;
pub const SCANCODE_THOUSANDSSEPARATOR = 178;
pub const SCANCODE_DECIMALSEPARATOR = 179;
pub const SCANCODE_CURRENCYUNIT = 180;
pub const SCANCODE_CURRENCYSUBUNIT = 181;
pub const SCANCODE_KP_LEFTPAREN = 182;
pub const SCANCODE_KP_RIGHTPAREN = 183;
pub const SCANCODE_KP_LEFTBRACE = 184;
pub const SCANCODE_KP_RIGHTBRACE = 185;
pub const SCANCODE_KP_TAB = 186;
pub const SCANCODE_KP_BACKSPACE = 187;
pub const SCANCODE_KP_A = 188;
pub const SCANCODE_KP_B = 189;
pub const SCANCODE_KP_C = 190;
pub const SCANCODE_KP_D = 191;
pub const SCANCODE_KP_E = 192;
pub const SCANCODE_KP_F = 193;
pub const SCANCODE_KP_XOR = 194;
pub const SCANCODE_KP_POWER = 195;
pub const SCANCODE_KP_PERCENT = 196;
pub const SCANCODE_KP_LESS = 197;
pub const SCANCODE_KP_GREATER = 198;
pub const SCANCODE_KP_AMPERSAND = 199;
pub const SCANCODE_KP_DBLAMPERSAND = 200;
pub const SCANCODE_KP_VERTICALBAR = 201;
pub const SCANCODE_KP_DBLVERTICALBAR = 202;
pub const SCANCODE_KP_COLON = 203;
pub const SCANCODE_KP_HASH = 204;
pub const SCANCODE_KP_SPACE = 205;
pub const SCANCODE_KP_AT = 206;
pub const SCANCODE_KP_EXCLAM = 207;
pub const SCANCODE_KP_MEMSTORE = 208;
pub const SCANCODE_KP_MEMRECALL = 209;
pub const SCANCODE_KP_MEMCLEAR = 210;
pub const SCANCODE_KP_MEMADD = 211;
pub const SCANCODE_KP_MEMSUBTRACT = 212;
pub const SCANCODE_KP_MEMMULTIPLY = 213;
pub const SCANCODE_KP_MEMDIVIDE = 214;
pub const SCANCODE_KP_PLUSMINUS = 215;
pub const SCANCODE_KP_CLEAR = 216;
pub const SCANCODE_KP_CLEARENTRY = 217;
pub const SCANCODE_KP_BINARY = 218;
pub const SCANCODE_KP_OCTAL = 219;
pub const SCANCODE_KP_DECIMAL = 220;
pub const SCANCODE_KP_HEXADECIMAL = 221;

pub const SCANCODE_LCTRL = 224;
pub const SCANCODE_LSHIFT = 225;
pub const SCANCODE_LALT = 226;
pub const SCANCODE_LGUI = 227;
pub const SCANCODE_RCTRL = 228;
pub const SCANCODE_RSHIFT = 229;
pub const SCANCODE_RALT = 230;
pub const SCANCODE_RGUI = 231;

pub const SCANCODE_MODE = 257;

pub const SCANCODE_AUDIONEXT = 258;
pub const SCANCODE_AUDIOPREV = 259;
pub const SCANCODE_AUDIOSTOP = 260;
pub const SCANCODE_AUDIOPLAY = 261;
pub const SCANCODE_AUDIOMUTE = 262;
pub const SCANCODE_MEDIASELECT = 263;
pub const SCANCODE_WWW = 264;
pub const SCANCODE_MAIL = 265;
pub const SCANCODE_CALCULATOR = 266;
pub const SCANCODE_COMPUTER = 267;
pub const SCANCODE_AC_SEARCH = 268;
pub const SCANCODE_AC_HOME = 269;
pub const SCANCODE_AC_BACK = 270;
pub const SCANCODE_AC_FORWARD = 271;
pub const SCANCODE_AC_STOP = 272;
pub const SCANCODE_AC_REFRESH = 273;
pub const SCANCODE_AC_BOOKMARKS = 274;

pub const SCANCODE_BRIGHTNESSDOWN = 275;
pub const SCANCODE_BRIGHTNESSUP = 276;
pub const SCANCODE_DISPLAYSWITCH = 277;
pub const SCANCODE_KBDILLUMTOGGLE = 278;
pub const SCANCODE_KBDILLUMDOWN = 279;
pub const SCANCODE_KBDILLUMUP = 280;
pub const SCANCODE_EJECT = 281;
pub const SCANCODE_SLEEP = 282;

pub const SCANCODE_APP1 = 283;
pub const SCANCODE_APP2 = 284;

pub const NUM_SCANCODES = 285;

// === SDL Key codes ===
// Keycode masks and macros
pub const SDLK_SCANCODE_MASK = 1 << 30;
pub const SDLK_EXTENDED_MASK = 1 << 29;

// Keycode conversion fntion
pub fn scancodeToKeycode(scancode: Scancode) Keycode {
    return @as(Keycode, scancode) | SDLK_SCANCODE_MASK;
}
const STK = scancodeToKeycode;

// Printable character keycodes
pub const SDLK_UNKNOWN = 0;
pub const SDLK_RETURN = '\r';
pub const SDLK_ESCAPE = '\x1B';
pub const SDLK_BACKSPACE = '\x08';
pub const SDLK_TAB = '\t';
pub const SDLK_SPACE = ' ';
pub const SDLK_EXCLAIM = '!';
pub const SDLK_DBLAPOSTROPHE = '"';
pub const SDLK_HASH = '#';
pub const SDLK_DOLLAR = '$';
pub const SDLK_PERCENT = '%';
pub const SDLK_AMPERSAND = '&';
pub const SDLK_APOSTROPHE = '\'';
pub const SDLK_LEFTPAREN = '(';
pub const SDLK_RIGHTPAREN = ')';
pub const SDLK_ASTERISK = '*';
pub const SDLK_PLUS = '+';
pub const SDLK_COMMA = ',';
pub const SDLK_MINUS = '-';
pub const SDLK_PERIOD = '.';
pub const SDLK_SLASH = '/';
pub const SDLK_0 = '0';
pub const SDLK_1 = '1';
pub const SDLK_2 = '2';
pub const SDLK_3 = '3';
pub const SDLK_4 = '4';
pub const SDLK_5 = '5';
pub const SDLK_6 = '6';
pub const SDLK_7 = '7';
pub const SDLK_8 = '8';
pub const SDLK_9 = '9';
pub const SDLK_COLON = ':';
pub const SDLK_SEMICOLON = ';';
pub const SDLK_LESS = '<';
pub const SDLK_EQUALS = '=';
pub const SDLK_GREATER = '>';
pub const SDLK_QUESTION = '?';
pub const SDLK_AT = '@';
pub const SDLK_LEFTBRACKET = '[';
pub const SDLK_BACKSLASH = '\\';
pub const SDLK_RIGHTBRACKET = ']';
pub const SDLK_CARET = '^';
pub const SDLK_UNDERSCORE = '_';
pub const SDLK_BACKQUOTE = '`';
pub const SDLK_a = 'a';
pub const SDLK_b = 'b';
pub const SDLK_c = 'c';
pub const SDLK_d = 'd';
pub const SDLK_e = 'e';
pub const SDLK_f = 'f';
pub const SDLK_g = 'g';
pub const SDLK_h = 'h';
pub const SDLK_i = 'i';
pub const SDLK_j = 'j';
pub const SDLK_k = 'k';
pub const SDLK_l = 'l';
pub const SDLK_m = 'm';
pub const SDLK_n = 'n';
pub const SDLK_o = 'o';
pub const SDLK_p = 'p';
pub const SDLK_q = 'q';
pub const SDLK_r = 'r';
pub const SDLK_s = 's';
pub const SDLK_t = 't';
pub const SDLK_u = 'u';
pub const SDLK_v = 'v';
pub const SDLK_w = 'w';
pub const SDLK_x = 'x';
pub const SDLK_y = 'y';
pub const SDLK_z = 'z';
pub const SDLK_CAPSLOCK = STK(SCANCODE_CAPSLOCK);

// Function keys
pub const SDLK_F1 = STK(SCANCODE_F1);
pub const SDLK_F2 = STK(SCANCODE_F2);
pub const SDLK_F3 = STK(SCANCODE_F3);
pub const SDLK_F4 = STK(SCANCODE_F4);
pub const SDLK_F5 = STK(SCANCODE_F5);
pub const SDLK_F6 = STK(SCANCODE_F6);
pub const SDLK_F7 = STK(SCANCODE_F7);
pub const SDLK_F8 = STK(SCANCODE_F8);
pub const SDLK_F9 = STK(SCANCODE_F9);
pub const SDLK_F10 = STK(SCANCODE_F10);
pub const SDLK_F11 = STK(SCANCODE_F11);
pub const SDLK_F12 = STK(SCANCODE_F12);

// Arrow keys and navigation
pub const SDLK_PRINTSCREEN = STK(SCANCODE_PRINTSCREEN);
pub const SDLK_SCROLLLOCK = STK(SCANCODE_SCROLLLOCK);
pub const SDLK_PAUSE = STK(SCANCODE_PAUSE);
pub const SDLK_INSERT = STK(SCANCODE_INSERT);
pub const SDLK_HOME = STK(SCANCODE_HOME);
pub const SDLK_PAGEUP = STK(SCANCODE_PAGEUP);
pub const SDLK_DELETE = '\x7F';
pub const SDLK_END = STK(SCANCODE_END);
pub const SDLK_PAGEDOWN = STK(SCANCODE_PAGEDOWN);
pub const SDLK_RIGHT = STK(SCANCODE_RIGHT);
pub const SDLK_LEFT = STK(SCANCODE_LEFT);
pub const SDLK_DOWN = STK(SCANCODE_DOWN);
pub const SDLK_UP = STK(SCANCODE_UP);

// Keypad keys
pub const SDLK_NUMLOCKCLEAR = STK(SCANCODE_NUMLOCKCLEAR);
pub const SDLK_KP_DIVIDE = STK(SCANCODE_KP_DIVIDE);
pub const SDLK_KP_MULTIPLY = STK(SCANCODE_KP_MULTIPLY);
pub const SDLK_KP_MINUS = STK(SCANCODE_KP_MINUS);
pub const SDLK_KP_PLUS = STK(SCANCODE_KP_PLUS);
pub const SDLK_KP_ENTER = STK(SCANCODE_KP_ENTER);
pub const SDLK_KP_1 = STK(SCANCODE_KP_1);
pub const SDLK_KP_2 = STK(SCANCODE_KP_2);
pub const SDLK_KP_3 = STK(SCANCODE_KP_3);
pub const SDLK_KP_4 = STK(SCANCODE_KP_4);
pub const SDLK_KP_5 = STK(SCANCODE_KP_5);
pub const SDLK_KP_6 = STK(SCANCODE_KP_6);
pub const SDLK_KP_7 = STK(SCANCODE_KP_7);
pub const SDLK_KP_8 = STK(SCANCODE_KP_8);
pub const SDLK_KP_9 = STK(SCANCODE_KP_9);
pub const SDLK_KP_0 = STK(SCANCODE_KP_0);
pub const SDLK_KP_PERIOD = STK(SCANCODE_KP_PERIOD);

// International and multimedia keys
pub const SDLK_APPLICATION = STK(SCANCODE_APPLICATION);
pub const SDLK_POWER = STK(SCANCODE_POWER);
pub const SDLK_KP_EQUALS = STK(SCANCODE_KP_EQUALS);
pub const SDLK_F13 = STK(SCANCODE_F13);
pub const SDLK_F14 = STK(SCANCODE_F14);
pub const SDLK_F15 = STK(SCANCODE_F15);
pub const SDLK_F16 = STK(SCANCODE_F16);
pub const SDLK_F17 = STK(SCANCODE_F17);
pub const SDLK_F18 = STK(SCANCODE_F18);
pub const SDLK_F19 = STK(SCANCODE_F19);
pub const SDLK_F20 = STK(SCANCODE_F20);
pub const SDLK_F21 = STK(SCANCODE_F21);
pub const SDLK_F22 = STK(SCANCODE_F22);
pub const SDLK_F23 = STK(SCANCODE_F23);
pub const SDLK_F24 = STK(SCANCODE_F24);
pub const SDLK_EXECUTE = STK(SCANCODE_EXECUTE);
pub const SDLK_HELP = STK(SCANCODE_HELP);
pub const SDLK_MENU = STK(SCANCODE_MENU);
pub const SDLK_SELECT = STK(SCANCODE_SELECT);
pub const SDLK_STOP = STK(SCANCODE_STOP);
pub const SDLK_AGAIN = STK(SCANCODE_AGAIN);
pub const SDLK_UNDO = STK(SCANCODE_UNDO);
pub const SDLK_CUT = STK(SCANCODE_CUT);
pub const SDLK_COPY = STK(SCANCODE_COPY);
pub const SDLK_PASTE = STK(SCANCODE_PASTE);
pub const SDLK_FIND = STK(SCANCODE_FIND);
pub const SDLK_MUTE = STK(SCANCODE_MUTE);
pub const SDLK_VOLUMEUP = STK(SCANCODE_VOLUMEUP);
pub const SDLK_VOLUMEDOWN = STK(SCANCODE_VOLUMEDOWN);

// Additional keypad keys
pub const SDLK_KP_COMMA = STK(SCANCODE_KP_COMMA);
pub const SDLK_KP_EQUALSAS400 = STK(SCANCODE_KP_EQUALSAS400);

// Language-specific keys
pub const SDLK_ALTERASE = STK(SCANCODE_ALTERASE);
pub const SDLK_SYSREQ = STK(SCANCODE_SYSREQ);
pub const SDLK_CANCEL = STK(SCANCODE_CANCEL);
pub const SDLK_CLEAR = STK(SCANCODE_CLEAR);
pub const SDLK_PRIOR = STK(SCANCODE_PRIOR);
pub const SDLK_RETURN2 = STK(SCANCODE_RETURN2);
pub const SDLK_SEPARATOR = STK(SCANCODE_SEPARATOR);
pub const SDLK_OUT = STK(SCANCODE_OUT);
pub const SDLK_OPER = STK(SCANCODE_OPER);
pub const SDLK_CLEARAGAIN = STK(SCANCODE_CLEARAGAIN);
pub const SDLK_CRSEL = STK(SCANCODE_CRSEL);
pub const SDLK_EXSEL = STK(SCANCODE_EXSEL);

// Extended keypad keys
pub const SDLK_KP_00 = STK(SCANCODE_KP_00);
pub const SDLK_KP_000 = STK(SCANCODE_KP_000);
pub const SDLK_THOUSANDSSEPARATOR = STK(SCANCODE_THOUSANDSSEPARATOR);
pub const SDLK_DECIMALSEPARATOR = STK(SCANCODE_DECIMALSEPARATOR);
pub const SDLK_CURRENCYUNIT = STK(SCANCODE_CURRENCYUNIT);
pub const SDLK_CURRENCYSUBUNIT = STK(SCANCODE_CURRENCYSUBUNIT);
pub const SDLK_KP_LEFTPAREN = STK(SCANCODE_KP_LEFTPAREN);
pub const SDLK_KP_RIGHTPAREN = STK(SCANCODE_KP_RIGHTPAREN);
pub const SDLK_KP_LEFTBRACE = STK(SCANCODE_KP_LEFTBRACE);
pub const SDLK_KP_RIGHTBRACE = STK(SCANCODE_KP_RIGHTBRACE);
pub const SDLK_KP_TAB = STK(SCANCODE_KP_TAB);
pub const SDLK_KP_BACKSPACE = STK(SCANCODE_KP_BACKSPACE);
pub const SDLK_KP_A = STK(SCANCODE_KP_A);
pub const SDLK_KP_B = STK(SCANCODE_KP_B);
pub const SDLK_KP_C = STK(SCANCODE_KP_C);
pub const SDLK_KP_D = STK(SCANCODE_KP_D);
pub const SDLK_KP_E = STK(SCANCODE_KP_E);
pub const SDLK_KP_F = STK(SCANCODE_KP_F);
pub const SDLK_KP_XOR = STK(SCANCODE_KP_XOR);
pub const SDLK_KP_POWER = STK(SCANCODE_KP_POWER);
pub const SDLK_KP_PERCENT = STK(SCANCODE_KP_PERCENT);
pub const SDLK_KP_LESS = STK(SCANCODE_KP_LESS);
pub const SDLK_KP_GREATER = STK(SCANCODE_KP_GREATER);
pub const SDLK_KP_AMPERSAND = STK(SCANCODE_KP_AMPERSAND);
pub const SDLK_KP_DBLAMPERSAND = STK(SCANCODE_KP_DBLAMPERSAND);
pub const SDLK_KP_VERTICALBAR = STK(SCANCODE_KP_VERTICALBAR);
pub const SDLK_KP_DBLVERTICALBAR = STK(SCANCODE_KP_DBLVERTICALBAR);
pub const SDLK_KP_COLON = STK(SCANCODE_KP_COLON);
pub const SDLK_KP_HASH = STK(SCANCODE_KP_HASH);
pub const SDLK_KP_SPACE = STK(SCANCODE_KP_SPACE);
pub const SDLK_KP_AT = STK(SCANCODE_KP_AT);
pub const SDLK_KP_EXCLAM = STK(SCANCODE_KP_EXCLAM);
pub const SDLK_KP_MEMSTORE = STK(SCANCODE_KP_MEMSTORE);
pub const SDLK_KP_MEMRECALL = STK(SCANCODE_KP_MEMRECALL);
pub const SDLK_KP_MEMCLEAR = STK(SCANCODE_KP_MEMCLEAR);
pub const SDLK_KP_MEMADD = STK(SCANCODE_KP_MEMADD);
pub const SDLK_KP_MEMSUBTRACT = STK(SCANCODE_KP_MEMSUBTRACT);
pub const SDLK_KP_MEMMULTIPLY = STK(SCANCODE_KP_MEMMULTIPLY);
pub const SDLK_KP_MEMDIVIDE = STK(SCANCODE_KP_MEMDIVIDE);
pub const SDLK_KP_PLUSMINUS = STK(SCANCODE_KP_PLUSMINUS);
pub const SDLK_KP_CLEAR = STK(SCANCODE_KP_CLEAR);
pub const SDLK_KP_CLEARENTRY = STK(SCANCODE_KP_CLEARENTRY);
pub const SDLK_KP_BINARY = STK(SCANCODE_KP_BINARY);
pub const SDLK_KP_OCTAL = STK(SCANCODE_KP_OCTAL);
pub const SDLK_KP_DECIMAL = STK(SCANCODE_KP_DECIMAL);
pub const SDLK_KP_HEXADECIMAL = STK(SCANCODE_KP_HEXADECIMAL);

// Modifier keys
pub const SDLK_LCTRL = STK(SCANCODE_LCTRL);
pub const SDLK_LSHIFT = STK(SCANCODE_LSHIFT);
pub const SDLK_LALT = STK(SCANCODE_LALT);
pub const SDLK_LGUI = STK(SCANCODE_LGUI);
pub const SDLK_RCTRL = STK(SCANCODE_RCTRL);
pub const SDLK_RSHIFT = STK(SCANCODE_RSHIFT);
pub const SDLK_RALT = STK(SCANCODE_RALT);
pub const SDLK_RGUI = STK(SCANCODE_RGUI);

// Mode and media keys
pub const SDLK_MODE = STK(SCANCODE_MODE);
pub const SDLK_AUDIONEXT = STK(SCANCODE_AUDIONEXT);
pub const SDLK_AUDIOPREV = STK(SCANCODE_AUDIOPREV);
pub const SDLK_AUDIOSTOP = STK(SCANCODE_AUDIOSTOP);
pub const SDLK_AUDIOPLAY = STK(SCANCODE_AUDIOPLAY);
pub const SDLK_AUDIOMUTE = STK(SCANCODE_AUDIOMUTE);
pub const SDLK_MEDIASELECT = STK(SCANCODE_MEDIASELECT);
pub const SDLK_WWW = STK(SCANCODE_WWW);
pub const SDLK_MAIL = STK(SCANCODE_MAIL);
pub const SDLK_CALCULATOR = STK(SCANCODE_CALCULATOR);
pub const SDLK_COMPUTER = STK(SCANCODE_COMPUTER);
pub const SDLK_AC_SEARCH = STK(SCANCODE_AC_SEARCH);
pub const SDLK_AC_HOME = STK(SCANCODE_AC_HOME);
pub const SDLK_AC_BACK = STK(SCANCODE_AC_BACK);
pub const SDLK_AC_FORWARD = STK(SCANCODE_AC_FORWARD);
pub const SDLK_AC_STOP = STK(SCANCODE_AC_STOP);
pub const SDLK_AC_REFRESH = STK(SCANCODE_AC_REFRESH);
pub const SDLK_AC_BOOKMARKS = STK(SCANCODE_AC_BOOKMARKS);

// System control keys
pub const SDLK_BRIGHTNESSDOWN = STK(SCANCODE_BRIGHTNESSDOWN);
pub const SDLK_BRIGHTNESSUP = STK(SCANCODE_BRIGHTNESSUP);
pub const SDLK_DISPLAYSWITCH = STK(SCANCODE_DISPLAYSWITCH);
pub const SDLK_KBDILLUMTOGGLE = STK(SCANCODE_KBDILLUMTOGGLE);
pub const SDLK_KBDILLUMDOWN = STK(SCANCODE_KBDILLUMDOWN);
pub const SDLK_KBDILLUMUP = STK(SCANCODE_KBDILLUMUP);
pub const SDLK_EJECT = STK(SCANCODE_EJECT);
pub const SDLK_SLEEP = STK(SCANCODE_SLEEP);

// Application keys
pub const SDLK_APP1 = STK(SCANCODE_APP1);
pub const SDLK_APP2 = STK(SCANCODE_APP2);

// === Mouse Button Constants ===
// These are handled through mouse events but included for completeness
pub const BUTTON_LEFT = 1;
pub const BUTTON_MIDDLE = 2;
pub const BUTTON_RIGHT = 3;
pub const BUTTON_X1 = 4;
pub const BUTTON_X2 = 5;

// Mouse button masks
pub const BUTTON_LMASK = 1 << (BUTTON_LEFT - 1);
pub const BUTTON_MMASK = 1 << (BUTTON_MIDDLE - 1);
pub const BUTTON_RMASK = 1 << (BUTTON_RIGHT - 1);
pub const BUTTON_X1MASK = 1 << (BUTTON_X1 - 1);
pub const BUTTON_X2MASK = 1 << (BUTTON_X2 - 1);

// === Key Modifier constants ===
pub const KMOD_NONE = 0x0000;
pub const KMOD_LSHIFT = 0x0001;
pub const KMOD_RSHIFT = 0x0002;
pub const KMOD_LCTRL = 0x0040;
pub const KMOD_RCTRL = 0x0080;
pub const KMOD_LALT = 0x0100;
pub const KMOD_RALT = 0x0200;
pub const KMOD_LGUI = 0x0400;
pub const KMOD_RGUI = 0x0800;
pub const KMOD_NUM = 0x1000;
pub const KMOD_CAPS = 0x2000;
pub const KMOD_MODE = 0x4000;
pub const KMOD_SCROLL = 0x8000;

// Convenient combinations
pub const KMOD_SHIFT = KMOD_LSHIFT | KMOD_RSHIFT;
pub const KMOD_CTRL = KMOD_LCTRL | KMOD_RCTRL;
pub const KMOD_ALT = KMOD_LALT | KMOD_RALT;
pub const KMOD_GUI = KMOD_LGUI | KMOD_RGUI;

// === Utility Functions ===
/// Check if a keycode is printable (character)
pub fn isPrintable(keycode: Keycode) bool {
    return (keycode & SDLK_SCANCODE_MASK) == 0 and keycode >= 32 and keycode <= 126;
}

/// Check if a keycode represents a scancode
pub fn isScancodeKeycode(keycode: Keycode) bool {
    return (keycode & SDLK_SCANCODE_MASK) != 0;
}

/// Get the scancode from a keycode if it represents one
pub fn keycodeToScancode(keycode: Keycode) ?Scancode {
    if (isScancodeKeycode(keycode)) {
        return @intCast(keycode & ~@as(Keycode, SDLK_SCANCODE_MASK));
    }
    return null;
}
