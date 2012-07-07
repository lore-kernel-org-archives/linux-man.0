From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fixes for lockf.3
Date: Sat, 7 Jul 2012 07:17:53 +0200
Message-ID: <CAKgNAkga6ugA9wBGFzRw17MXu55qa30_cSKNa5Sz1x-R02pKxA@mail.gmail.com>
References: <20120705005009.23975.qmail@kosh.dhis.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120705005009.23975.qmail-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Alan,

On Thu, Jul 5, 2012 at 2:50 AM,  <pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org> wrote:
> In lockf(3), the description of EDEADLK says that it can occur with the
> T_LOCK operation. That should be F_LOCK. The presence of the T makes it look
> like maybe F_TLOCK was intended, but that would be wrong. Only the blocking
> F_LOCK operation can cause EDEADLK.

Thanks. Fixed for 3.42.

> Also, I was looking through Changes.old for the last few versions, and
> noticed that fcntl.h was misspelled fntl.h a couple of times.

Also fixed now.

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
