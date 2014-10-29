From: Will Newton <will.newton-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: ilogb manpage
Date: Wed, 29 Oct 2014 12:18:26 +0000
Message-ID: <CANu=DmhD79gzEoXR=cSoKkQC6rzYwrP_iGD-Ljn6zf9GWFY0Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The ilogb manpage currently claims that errno is not set on error:

       Domain error: x is 0 or a NaN
              An invalid floating-point exception (FE_INVALID) is raised.

              These functions do not set errno for this case.

       Domain error: x is an infinity

              These functions do not set errno or raise an exception
for this case.

However this is at odds with the ISO C standard an the most recent glibc code:

int
__ilogb (double x)
{
  int r = __ieee754_ilogb (x);
  if (__builtin_expect (r == FP_ILOGB0, 0)
      || __builtin_expect (r == FP_ILOGBNAN, 0)
      || __builtin_expect (r == INT_MAX, 0))
    {
      __set_errno (EDOM);
      feraiseexcept (FE_INVALID);
    }
  return r;
}


-- 
Will Newton
Toolchain Working Group, Linaro
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
