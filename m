From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Possible typo in madvise(2)
Date: Tue, 01 Apr 2014 20:18:43 +0200
Message-ID: <533B0303.2000601@gmail.com>
References: <5334B14B.7070409@umich.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5334B14B.7070409-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Roper <aroper-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/28/2014 12:16 AM, Alex Roper wrote:
> Version: Current git repo
> 
> The first paragraph of DESCRIPTION states that madvise does not change
> the semantics of an application except in the case of MADV_DONTNEED,
> which I believe should read MADV_DONTFORK.

Alex, 

MADV_DONTNEED does change the semantics. But, could you say more
about wht you think MADV_DONTFORK should have been written here 
instead? (Perhaps some fix is needed to the page.)

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
