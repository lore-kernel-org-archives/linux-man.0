From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] getrlimit.2: ATTRIBUTES: Note functions that are
 thread-safe
Date: Thu, 14 May 2015 09:06:38 +0800
Message-ID: <1431565598.30611.1.camel@G08FNSTD140232>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <1431500032-26865-2-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <55536AFD.90603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55536AFD.90603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Wed, 2015-05-13 at 17:17 +0200, Michael Kerrisk (man-pages) wrote:
> On 05/13/2015 08:53 AM, Zeng Linggang wrote:
> > After research, We think prlimit() is thread-safe. But, there
> > is not marking of prlimit() in glibc document.
> > getrlimit() and setrlimit() match glibc markings.
> > - getrlimit: MT-Safe
> > - setrlimit: MT-Safe
> 
> The following line would best be omitted. All I'd like to see here is 
> what's in the glibc manual.
> 

OK.

Thank you.

Best regards,
Zeng

> > - prlimit:   MT-Safe
> 
> Thanks, Zeng Linggang. Patch applied.
> 
> Cheers,
> 
> Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
