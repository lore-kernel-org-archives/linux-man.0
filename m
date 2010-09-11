From: ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org
Subject: function cerf in manpage but not in <complex.h>
Date: Sun, 12 Sep 2010 00:06:48 +0200 (CEST)
Message-ID: <b7b0d7b84ae39fc2c80b7efd5d04965a.squirrel@webmail-lpp.polytechnique.fr>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in my system (2.6.34-gentoo-r2), "man cerf" gives me the description of a
certain complex error function. This function however is nowhere to be
found. I tried this on 5 other linux boxes with the same result.

May be the function was taken out at some point but the documentation stayed.

Here is a minimum test file which can be saved as "test.c" and complied as

gcc test.c -lm

------
#include <math.h>
#include <complex.h>
#include <stdio.h>

int main (void){
        double complex b,c;
        b=I*0.2;
        c=cerf(b);
        printf("%f + i%f\n",creal(c),cimag(c));
}
------

regards,

Ozgur,

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
