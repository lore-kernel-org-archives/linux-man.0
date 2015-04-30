From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] gethostid.3: ATTRIBUTES: Note functions that isn't
 thread-safe
Date: Thu, 30 Apr 2015 09:51:16 +0800
Message-ID: <1430358676.7745.40.camel@G08JYZSD130126.localdomain>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <1429764710-8598-2-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <55412DAC.2020404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55412DAC.2020404-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Wed, 2015-04-29 at 21:14 +0200, Michael Kerrisk (man-pages) wrote:
> On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> > The markings match glibc markings.
> > markings of functions in glibc are:
> > - gethostid: MT-Safe hostid env locale
> > - sethostid: MT-Unsafe const:hostid
> 
> 
> Thanks, Zeng. Applied.
> 
> It's probably better to title patches like this as:
> 
>      ATTRIBUTES: Note functions that are/aren't thread-safe
> 

OK, thank you very much.

Best regards,
zeng

> Cheers,
> 
> Michael
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
