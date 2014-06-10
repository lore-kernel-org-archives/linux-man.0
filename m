From: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] mq_unlink.3: ATTRIBUTES: Note function that is
 thread-safe
Date: Tue, 10 Jun 2014 14:28:42 +0800
Message-ID: <1402381722.1169.1.camel@fedora>
References: <1402285503.1804.34.camel@fedora> <5395F590.5060005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5395F590.5060005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael

Yeah, You are right. I'm working together with Peng Haitao.

Qian Lei

On Mon, 2014-06-09 at 19:57 +0200, Michael Kerrisk (man-pages) wrote:
> On 06/09/2014 05:45 AM, Qian Lei wrote:
> > The function mq_unlink() is thread safe.
> 
> Hello Qian Lei,
> 
> Am I correct to assume that you are working together with Peng Haitao?
> 
> Cheers,
> 
> Michael
> 
> 
> > Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> > ---
> >  man3/mq_unlink.3 | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/man3/mq_unlink.3 b/man3/mq_unlink.3
> > index 19b977f..bf49e9c 100644
> > --- a/man3/mq_unlink.3
> > +++ b/man3/mq_unlink.3
> > @@ -59,6 +59,11 @@ was too long.
> >  .B ENOENT
> >  There is no message queue with the given
> >  .IR name .
> > +.SH ATTRIBUTES
> > +.SS Multithreading (see pthreads(7))
> > +The
> > +.BR mq_unlink ()
> > +function is thread-safe.
> >  .SH CONFORMING TO
> >  POSIX.1-2001.
> >  .SH SEE ALSO
> > 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
