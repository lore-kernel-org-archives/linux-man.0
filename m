From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: symlink(7) missing {to|of} in 'pathname another file' (3.56,
 man7.org)
Date: Tue, 21 Jan 2014 14:51:15 +0100
Message-ID: <52DE7B53.9000505@gmail.com>
References: <1401161.fNpqManq3C@lt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401161.fNpqManq3C@lt>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Posch <man-pages-rFD0ZvQNamoRTZDQkHJ3v7NAH6kLmebB@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/21/2014 01:43 PM, Thomas Posch wrote:
> Hello,
> 
> in section 'SYMBOLIC LINK HANDLING' of symlink(7) the first sentence of the 
> third paragraph reads:
>     A symbolic link is a special type of file whose contents are a string
>     that is the pathname another file, the file to which the link refers.
> 
> Is there a {to|of} missing in '... pathname another file, ...'?
> 
> Found in man-pages version 3.56 at man7.org.
> 
> 
> Thank you for your effort.

Thanks, Thomas. Fixed (added "of").

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
