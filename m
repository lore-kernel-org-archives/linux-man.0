From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Quoting in man 5 core
Date: Mon, 15 Nov 2010 07:20:59 +0100
Message-ID: <AANLkTim7Gr1aWe4_CWytT1sWbynw1QYxRq3t7n7htjwd@mail.gmail.com>
References: <AANLkTikwZqfGUBciUhNhjvoLr96jXC0rMcgKrOyckb4r@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikwZqfGUBciUhNhjvoLr96jXC0rMcgKrOyckb4r-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Pate <roger-BhOJIT0taCA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Roger,

On Tue, Nov 9, 2010 at 12:36 AM, Roger Pate <roger-BhOJIT0taCA@public.gmane.org> wrote:
> man 5 core; http://www.kernel.org/doc/man-pages/online/pages/man5/cor=
e.5.html
>
> The example section has a sample shell session containing:
>
> =A0# echo '|$PWD/core_pattern_pipe_test %p UID=3D%u GID=3D%g sig=3D%s=
'
>
> But $PWD won't be expanded in single quotes. =A0It should be double
> quotes around the entire argument or some other form.

Thanks. Fixed for man-pages-3.32.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
