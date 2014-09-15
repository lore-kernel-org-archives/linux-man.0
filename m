From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Thread-safety of iconv()
Date: Mon, 15 Sep 2014 12:32:37 +0300
Message-ID: <5416B235.8020309@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael, Haitao,

iconv(3) states:

ATTRIBUTES
   Multithreading (see pthreads(7))
       The iconv() function is thread-safe.

But iconv_open(3) says:

A conversion descriptor contains a conversion  state.   After  creation
using iconv_open(), the state is in the initial state.  Using iconv(3)
modifies the descriptor's conversion state.  (This implies that a  con-
version descriptor can not be used in multiple threads simultaneously.)
To bring the state back to the initial state, use iconv(3) with NULL as
inbuf argument.

This looks a bit unclear, do you think you could clarify iconv(3) and/or
iconv_open(3) a bit in thread-safety regard?

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
