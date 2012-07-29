From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: raw.7 missing ETH_P_ALL hack
Date: Sun, 29 Jul 2012 06:32:35 +0200
Message-ID: <CAKgNAki70auDaFRkk430FNNz3icNEMzr+JOOq=trGigvX_7V0A@mail.gmail.com>
References: <alpine.LSU.2.00.0910221353080.21589@obet.zrqbmnf.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.0910221353080.21589-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Oct 22, 2009 at 1:56 PM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> wrote:
> Hi,
>
>
> some codes use a raw socket with ETH_P_ALL, such as
> http://code.google.com/p/libdnet/source/browse/trunk/src/eth-linux.c
> However this is not documented yet in raw(7).

Does packet(7) not give you what you are looking for?


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
