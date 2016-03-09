From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: STV_PROTECTED
Date: Wed, 9 Mar 2016 02:03:37 +0100
Message-ID: <56DF7669.70204@gmail.com>
References: <20150929101411.GA17105@skagos.loria.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150929101411.GA17105-0+RUnzqQamR98t58zOhiHA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Corona <gabriel.corona-Pj3lBMu8rt9bbU8NOSLlsg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Mike]

Hello Gabriel,

On 09/29/2015 12:14 PM, Gabriel Corona wrote:
> Hi,
> 
> The elf manpage [2] claims that:
> 
>> STV_PROTECTED   Not preemptible, not exported.
> 
> However the System V gABI [1] claims that:
> 
>> A symbol defined in the current component is protected if it is
>> visible in other components but not preemptable
> 
> Should the manpage read something like:
> 
>> STV_PROTECTED   Not preemptible but exported.
> 
> [1] http://www.sco.com/developers/gabi/2003-12-17/ch4.symtab.html
> 
> [2] http://man7.org/linux/man-pages/man5/elf.5.html

I think you are right, but let's see if Mike might confirm,
since he originally added that text. (Mike, I suspect there
was a wordo here.)

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
