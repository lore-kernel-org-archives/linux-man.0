From: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Recently, the atanh implementation was changed, but the man seems not changed yet
Date: Thu, 18 Feb 2010 12:19:58 +0900 (JST)
Message-ID: <20100218115807.733E.A69D9226@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

I recently found little mismatch between the impmentation and the man in
atanh function.

current man page says
http://www.kernel.org/doc/man-pages/online/pages/man3/atanh.3.html

---------------------------------------------------------
BUGS
       For a pole error, errno is set to EDOM; POSIX.1 says it should be set to
       ERANGE.
---------------------------------------------------------

but following test programs "34: Numerical result out of range".
It mean atanh return ERANGE rightly.


atanh_test.c
---------------------------------------------------------
#include <math.h>
#include <stdio.h>
#include <sys/errno.h>
#include <string.h>

int main(void)
{
        double d;

        d = atanh(1.0);
        if (d == HUGE_VAL)
                printf("huge %d: %s\n", errno, strerror(errno));
        else
                printf("Oops no error\n");

        return 0;
}
---------------------------------------------------------


I dug in glibc's ChangeLog and I found following change.
So, can we consider to change the man too?


---------------------------------------------------------
2009-04-26  Ulrich Drepper  <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

        * sysdeps/ieee754/dbl-64/s_expm1.c: Set errno for overflow.
        * sysdeps/ieee754/flt-32/s_expm1f.c: Likewise.
        * sysdeps/x86_64/fpu/s_expm1l.S: Likewise.

        * sysdeps/ieee754/k_standard.c (__kernel_standard): Pole errors in
        atanh should set ERANGE.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
