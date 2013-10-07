From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: modf, modff, modfl etc
Date: Mon, 7 Oct 2013 19:04:57 +0100
Message-ID: <CAGc9Evdt87nafwpixnSt9TiZx27Z1sfONEkTvhgmue9DzDFSbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello mtk

Should functions like modf(), which have float, and long-double
precision include that explanation in the DESCRIPTION section of the
man page? eg. add something about modff, modfl

http://man7.org/linux/man-pages/man3/modf.3.html

Current text:

"The modf() function breaks the argument x into an integral part and a
fractional part, each of which has the same sign as x.  The integral
part is stored in the location pointed to by iptr."


Could be changed to:
"The modf() function breaks the argument x into an integral part and a
fractional part, each of which has the same sign as x.  The integral
part is stored in the location pointed to by iptr. The modff() function
operates the same way with float. The modfl() function operates the
same way with long double"




Similarly same query applies to others:
http://man7.org/linux/man-pages/man3/ldexp.3.html
http://man7.org/linux/man-pages/man3/frexp.3.html


"CONFORMING TO         top

       C99, POSIX.1-2001.  The variant returning double also conforms to
       SVr4, 4.3BSD, C89."

^ Should this say "modf which returns double also conforms to" etc,
just to be clear which one it is?
Does this meant hat modff and modfl don't conform?


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
