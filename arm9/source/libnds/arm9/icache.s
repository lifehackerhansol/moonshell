;/*---------------------------------------------------------------------------------
;  $Id: icache.s,v 1.1 2006/07/04 01:45:05 wntrmute Exp $
;
;  Copyright (C) 2005
;  	Michael Noland (joat)
;  	Jason Rogers (dovoto)
;  	Dave Murphy (WinterMute)
;
;  This software is provided 'as-is', without any express or implied
;  warranty.  In no event will the authors be held liable for any
;  damages arising from the use of this software.
;
;  Permission is granted to anyone to use this software for any
;  purpose, including commercial applications, and to alter it and
;  redistribute it freely, subject to the following restrictions:
;
;  1. The origin of this software must not be misrepresented; you
;     must not claim that you wrote the original software. If you use
;     this software in a product, an acknowledgment in the product
;     documentation would be appreciated but is not required.
;  2. Altered source versions must be plainly marked as such, and
;     must not be misrepresented as being the original software.
;  3. This notice may not be removed or altered from any source
;     distribution.

;---------------------------------------------------------------------------------*/
ICACHE_SIZE EQU	0x2000
DCACHE_SIZE EQU	0x1000
CACHE_LINE_SIZE EQU	32
;//---------------------------------------------------------------------------------
    AREA     globals,CODE,READONLY
;//---------------------------------------------------------------------------------
	EXPORT IC_InvalidateAll
;//---------------------------------------------------------------------------------
IC_InvalidateAll
;/*---------------------------------------------------------------------------------
;	Clean and invalidate entire data cache
;---------------------------------------------------------------------------------*/
	mov	r0, #0
	mcr	p15, 0, r0, c7, c5, 0
	bx	lr

;//---------------------------------------------------------------------------------
	EXPORT IC_InvalidateRange
;//---------------------------------------------------------------------------------
IC_InvalidateRange
;/*---------------------------------------------------------------------------------
;	Invalidate a range
;---------------------------------------------------------------------------------*/
	add	r1, r1, r0
	bic	r0, r0, #CACHE_LINE_SIZE - 1
IC_InvalidateRange_invalidate
	mcr	p15, 0, r0, c7, c5, 1
	add	r0, r0, #CACHE_LINE_SIZE
	cmp	r0, r1
	blt	IC_InvalidateRange_invalidate
	bx	lr

  END