From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug in scanf() man page
Date: Wed, 06 May 2015 14:54:35 +0200
Message-ID: <554A0F0B.2040807@gmail.com>
References: <20121106000519.35cf80c4@tb900.no-ip.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121106000519.35cf80c4-s8mmrqNSKAkv06sN1NBJbw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jussi Lehtola <jussilehtola-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jussi,

On 11/05/2012 11:05 PM, Jussi Lehtola wrote:
> EOF  is also  returned if a read error occurs, in which case the error
> indicator for the stream (see ferror(3)) is set, and errno is  set
> indicate the error.
> 
> The latter clause is lacking a 'to'.

Late reply to this mail... I've fixed the page; thanks for the report.

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
