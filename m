From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: open(2) man-page in version 3.53
Date: Fri, 9 Aug 2013 09:49:54 +0200
Message-ID: <CAKgNAki+hxsqaxjndHJr1cUyJOb8ABhjnbUXqeo7DbtNBfo51g@mail.gmail.com>
References: <52024BFF.6000200@fixnetix.com> <52024C90.8030104@fixnetix.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52024C90.8030104-uV1bammHdgpWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Harris <robert.harris-uV1bammHdgpWk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Aug 7, 2013 at 3:33 PM, Robert Harris
<robert.harris-uV1bammHdgpWk0Htik3J/w@public.gmane.org> wrote:
>
>
> Sorry, a slip of the programming finger: correct patch is attached here.

Actually, the second patch also seems to be wrong. But I take the
point: mmap(2) should be in the list of calls that fail when given an
O_PATH descriptor. I've manually applied the change.

Thanks!

Michael

> -------- Original Message --------
> Subject: open(2) man-page in version 3.53
> Date: Wed, 07 Aug 2013 14:30:39 +0100
> From: Robert Harris <robert.harris-uV1bammHdgpWk0Htik3J/w@public.gmane.org>
> To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
>
> The list of system calls that fail with a file descriptor opened with the O_PATH flag set should include mmap(2). Patch is attached.
>
> With best wishes,
>
> Robert
> --
> Robert Harris
> Software Development
> Fixnetix Ltd
> 33 King William Street
> London EC4R 9AS
> DDI: +44 (0) 20 3008 5032
> email: robert.harris-uV1bammHdgpWk0Htik3J/w@public.gmane.org
> web: www.fixnetix.com
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
