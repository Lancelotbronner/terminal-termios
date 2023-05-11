//
//  ctermios.c
//  
//
//  Created by Christophe Bronner on 2023-05-10.
//

#include <ctermios.h>

const cc_t CTERMIOS_VDISABLE = _POSIX_VDISABLE;

cc_t ctermios_getcc(const struct termios *const termios, int flag) {
	return termios->c_cc[flag];
}

cc_t ctermios_setcc(struct termios *termios, int flag, cc_t value) {
	termios->c_cc[flag] = value;
}
