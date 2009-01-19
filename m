From: Nanno Langstraat <nlcom_os-lQF5CfOoLd8@public.gmane.org>
Subject: Re: New manpage for betoh64() and friends
Date: Mon, 19 Jan 2009 01:09:58 +0100
Message-ID: <4973C4D6.8010902@ii.nl>
References: <4873E122.1010504@ii.nl> <496DBD70.2010601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <496DBD70.2010601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> The version of the page that is currently committed for release in
> man-pages-3.17 is shown below.  Let me know if you see anything
> that needs fixing.
>
> .SH "CONFORMING TO"
> These functions are non-standard, but present on the BSDs,
> where the required header file is
> .I <sys/endian.h>
> instead of
> .IR <endian.h> .
>   

Alright, so it turns out that this is not accurate because of Ulrich
Drepper's beNtoh() versus OpenBSD's betohN() deviation.

(and FreeBSD into the mix is even more muddled: they got an earful from
Theo de Raadt over this issue)

Suggestion:

.SH "CONFORMING TO"
These functions are non-standard. The BSDs contain similar but not wholly identical functions in header file 
.I <sys/endian.h>
(instead of glibc's
.IR <endian.h> ).



It grates that this mealy-mouthed text is longer than the source changes
required to fix the differences, but hey.

    Nanno

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
