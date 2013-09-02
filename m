From: Christopher Hall <chall0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] printf.3: correctly describe the meaning of a negative precision
Date: Mon, 2 Sep 2013 15:41:56 +0100
Message-ID: <CAB4OWr2UVqnv5hyrY5RkjWHYwMVGFFyByTy3uNZyrHVBdE8wxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The printf(3) manpage says that a negative precision is taken to be
zero, whereas printf(3p) says that a negative precision is taken as if
the precision were omitted.  glibc agrees with the latter (posix)
specification.

Test code:

    printf("%f\n",42.0);      // "42.000000"
    printf("%.*f\n",0,42.0);  // "42"
    printf("%.*f\n",-1,42.0); // "42.000000"

This patch corrects the explanation to match what actually happens.

diff --git i/man3/printf.3 w/man3/printf.3
index f5e96d3..2c86bf1 100644
--- i/man3/printf.3
+++ w/man3/printf.3
@@ -409,8 +409,9 @@ Instead of a decimal digit string one may write
"*" or "*mquot;
 is given in the next argument, or in the m-th argument, respectively,
 which must be of type
 .IR int .
-If the precision is given as just \(aq.\(aq, or the precision is negative,
-the precision is taken to be zero.
+If the precision is given as just \(aq.\(aq, the precision is taken to
+be zero.  A negative precision is taken as if the precision were
+omitted.
 This gives the minimum number of digits to appear for
 .BR d ,
 .BR i ,


--
Chris Hall
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
