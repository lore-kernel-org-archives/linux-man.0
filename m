From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strtod(3) manual page not clear on error handling when endptr is
 null
Date: Mon, 9 May 2016 22:54:51 +0200
Message-ID: <e9ad0c55-5dc8-bca4-1cb9-e803887700d2@gmail.com>
References: <7E039918541B4C4183BFDB8F015C7430DEB54FB3@WCL-EXCH02.wcl.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7E039918541B4C4183BFDB8F015C7430DEB54FB3-wKnzbhvBYoCBAzx/YO/BcIT4S9po1h25@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ed Avis <eda-0aTcAJqSNDHby3iVrkZq2A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "'linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ed,

On 04/28/2016 06:31 PM, Ed Avis wrote:
> strtod(3) says:
> 
> If no conversion is performed, zero is returned and the value of nptr
> is stored in the location referenced by endptr.
> 
> This surely can't be the case if endptr is null.  I believe that the
> behaviour is more like
> 
> 
> If no conversion is performed, zero is returned, and (unless endptr
> is null) the value of nptr is stored in the location referenced by
> endptr.

Agreed. Page corrected.

Thanks,

Michael


> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
