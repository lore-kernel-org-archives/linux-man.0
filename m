From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 10:45:42 -0500
Message-ID: <54A2C8A6.9050100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael, Peng, Alex,

We have had some recent discussions about reetrancy safety
of dlopen. My goal is going to be to ensure that dlopen
and in general the intefaces in libdl remain reetrant to
allow user implemented malloc to use these interfaces to
load libraries that themselves may have reetrant helper
functions.

This raises the question: How do we clearly document which
functions are reetrant?

My thoughts are as follows:
* Add some introductory text about reetrancy in the safety
  section. This text will discuss that AS-safe functions
  are reetrant because they must be to be AS-safe. Note that
  reetrant functions need not be AS-safe nor MT-safe.

* Add a "R-Safe" and "R-Unsafe" to indicate safety with respect
  to reetrancy.

* Immediately annotate all AS-safe functions as R-Safe.

* Review all of the "_r" functions for reetrance safety.

Thoughts?

My review of other Unices indicates this is probably the
last type of safety that documented by other systems.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
