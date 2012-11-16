From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: proc.5: meminfo fixes
Date: Fri, 16 Nov 2012 07:56:58 +0100
Message-ID: <CAKgNAkijgnr8pvTmN4g8PEuFKqP1-fMBASYKcFHWecTpE8zpMQ@mail.gmail.com>
References: <20121115153955.GA18779@psychosis.jim.sh>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121115153955.GA18779-SRSuHwkuBJlaX0KmTac7FA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Paris <jim-XrPbb/hENzg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jim,

On Thu, Nov 15, 2012 at 4:39 PM, Jim Paris <jim-XrPbb/hENzg@public.gmane.org> wrote:
> In the /proc/meminfo section of proc.5:
>
> - "Mlock" should be "Mlocked".

Thanks. Fixed.

> - "SwapFree" reports free swap space, but the manpage seems to be
>   describing used swap space.

Hmmm. Interesting. Looking a bit at the code, I think you are right.
However, that text (which in any case makes little sense--"Memory
which has been evicted from RAM"?) came from
Documentation/filesystems/proc.txt, and has been there for many years
(since 2.6.0, at least).

I'll make the text "Amount of swap space that is currently unused."

I'll also submit a  patch for Documentation/filesystems/proc.txt.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
