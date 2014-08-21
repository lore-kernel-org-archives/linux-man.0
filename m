From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Addition to connect(2)
Date: Thu, 21 Aug 2014 17:09:07 -0500
Message-ID: <53F66E03.8070901@gmail.com>
References: <E1XJQGp-0000UO-0v@palantir.moria.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1XJQGp-0000UO-0v-lBFDS8/7i9huFsqOOl7tcLNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/18/2014 11:58 AM, Michael Haardt wrote:
> Hello,
> 
> the manual page does not describe the state of a socket after a
> failed connect call.  Surprisingly, there are TCP/IP stacks where
> it is unusable (met one today).  Opengroup also specifies that
> as allowed behaviour, so the manual should mention it.

Hello Michael

Thanks for the patch. I applied it, but dropped the piece 
"Although it works in Linux".

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
