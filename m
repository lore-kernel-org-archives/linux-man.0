From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mistake in glob(7)
Date: Sat, 28 Jul 2012 08:15:41 +0200
Message-ID: <CAKgNAkix_X2WYZautcYk360qAcvOTGDysbthyNKouvk8rY-nNQ@mail.gmail.com>
References: <CAGN0+FQjEkjL+qKD7fYrcDjHeMfiZ1TmVk6ag_GKFqsyzKrwKg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGN0+FQjEkjL+qKD7fYrcDjHeMfiZ1TmVk6ag_GKFqsyzKrwKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Peschel <aaron.peschel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Aaron,

On Fri, Jul 27, 2012 at 7:40 AM, Aaron Peschel <aaron.peschel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> man-pages release version 3.41
>
> Arch Linux
>
> Line reads:
>
>     With bash one can force the classical behavior by setting
> allow_null_glob_expansion=true.
>
> However this is no longer true.
>
> Line should read:
>
>     With bash one can force the classical behavior by setting shopt -s nullglob.
>
> -Aaron Peschel

Thanks. Fixed for man-pages-3.42.

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
