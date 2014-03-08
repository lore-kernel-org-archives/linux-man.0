From: Thomas Klausner <tk-JlXkzPh5ucKzZXS1Dc/lvw@public.gmane.org>
Subject: bug in dlopen(3) man page
Date: Sat, 8 Mar 2014 22:30:59 +0100
Message-ID: <20140308213059.GA25275@danbala.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KIzF6Cje4W/osXrF"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

There is a bug in dlopen(3). The NOTES section claims:

"The symbols RTLD_DEFAULT and RTLD_NEXT are defined by <dlfcn.h> only
when _GNU_SOURCE was defined before including it."

However, this is not correct.

>From dlfcn.h on a "Gentoo Base System release 2.1":
#ifdef __USE_GNU
...
# define RTLD_NEXT      ((void *) -1l)
...
# define RTLD_DEFAULT   ((void *) 0)
...

You can verify this by compiling the attached program. For me it gives:
test.c: In function `main':
test.c:8: error: `RTLD_NEXT' undeclared (first use in this function)
test.c:8: error: (Each undeclared identifier is reported only once
test.c:8: error: for each function it appears in.)

It works if I set "__USE_GNU_" instead.

Please also check the "Glibc extensions: dladdr() and dlvsym()"
section, it also mentions _GNU_SOURCE.
 Thomas
--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="test.c"

#include <stdio.h>
#include <stdlib.h>

#define _GNU_SOURCE
#include <dlfcn.h>

int main(int argc, char *argv[]) {
	printf ("RTLD_NEXT is %d\n", RTLD_NEXT);
	exit(0);
}

--KIzF6Cje4W/osXrF--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
