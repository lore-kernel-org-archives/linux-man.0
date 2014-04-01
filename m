From: Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org>
Subject: Bugs in the strtod/strtof man pages...
Date: Tue, 1 Apr 2014 20:55:18 +0100
Message-ID: <CADJ56BQnF=pX01y7pSyg6wOSYEc+OY4kphRMDkoUWTO+yTDpCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Both claim to set errno to ERANGE in under/overflow situations.  I'm
not seeing that - errno remains unset.

They also say that the functions will return HUGE_VALF or HUGE_VALL
for overflowed float or doubles respectively (or negative values of
same). What they fail to mention is that HUGE_VALF and HUGE_VALL are
defined in math.h.

The SYNOPSIS should include: #include <math.h>

The RETURN VALUE should mention that if errno is supposed to be set
that not all versions of glibc do so. Sadly for underflows
(0.0000000000000000000000000000000001) strto[df] returns 0 and doesn't
set errno so there's no real way to detect an error.

Code to check all this:

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int
main(int argc, char *argv[])
{
   float n;
   char *ns = "9999999999999999999999999999999999999999999999"
     "9999999999999999999.9999999999999999",
     *err_ns;

   n = strtod(ns, &err_ns);
   printf("HUGE_VALF: %f\nns: %f\n", HUGE_VALF, n);
   perror("errno: ");
}

Kevin

-- 
Kevin Lyda
Galway, Ireland
US Citizen overseas? We can vote.
Register now: http://www.votefromabroad.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
