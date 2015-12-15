From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: New manpage lirc.4 (Was: Possibly new manpages: lirc and
 lirc_ioctl)
Date: Tue, 15 Dec 2015 00:02:08 -0800
Message-ID: <20151215080208.GA16793@infradead.org>
References: <5664AAA5.6040203@gmail.com>
 <5664AB93.2040106@gmail.com>
 <20151214171521.GA30123@infradead.org>
 <566F0FC1.5020308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <566F0FC1.5020308-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Dec 14, 2015 at 07:51:45PM +0100, Alec Leamas wrote:
> On 14/12/15 18:15, Christoph Hellwig wrote:
> > On Sun, Dec 06, 2015 at 10:41:39PM +0100, Alec Leamas wrote:
> >> +#include " (\fIuapi/lirc.h\fP)"
> > 
> > Where is that header supposed to come from?
> > 
> 
> kernel-headers, once the media subsystem patch is merged.

Can you show me the piece of code that mangles the hierachy generated in
the kernel into a flat namespace?  The include path just doesn't seem
to fit our normal patterns.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
