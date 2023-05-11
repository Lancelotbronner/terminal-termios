//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-10.
//

#include <termios.h>

const cc_t CTERMIOS_VDISABLE;

cc_t ctermios_getcc(const struct termios *const termios, int flag);
cc_t ctermios_setcc(struct termios *termios, int flag, cc_t value);
