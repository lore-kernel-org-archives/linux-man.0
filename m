From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] setlocale.3: ATTRIBUTES: Note functions that isn't
 thread-safe
Date: Thu, 30 Apr 2015 09:53:34 +0800
Message-ID: <1430358814.7745.41.camel@G08JYZSD130126.localdomain>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <1429764710-8598-7-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <55412E53.6070203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55412E53.6070203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Wed, 2015-04-29 at 21:17 +0200, Michael Kerrisk (man-pages) wrote:
> On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> > The marking matches glibc marking.
> > The marking of functions in glibc is:
> > - setlocale: MT-Unsafe const:locale env
> 
> 
> Thanks, Zeng. Applied.
> 
> Note that the title of this patch as a number disagreement. It should
> say "Note function that isn't thread-safe" (i.e., s/functions/function).
> 

OK, thank you very much.

Best regards,
zeng

> Cheers,
> 
> Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
