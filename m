From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 2/5] s390_runtime_instr.2: document the removal
 of the second argument
Date: Wed, 31 Jan 2018 10:21:39 +0100
Message-ID: <20180131092139.GB3939@osiris>
References: <20180114185627.GA23602@asgard.redhat.com>
 <20180120114126.GC6287@osiris>
 <CACGkJduq-h=RdranSq_jbg3g65dKPLa5+P-85kR4Z+nFyfYe0w@mail.gmail.com>
 <20180131072002.GA3939@osiris>
 <CACGkJdsbrR2uwK0P1PaXC9YTKaXV0w-1jD1fu4vBrz5dFHMbLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACGkJdsbrR2uwK0P1PaXC9YTKaXV0w-1jD1fu4vBrz5dFHMbLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 31, 2018 at 08:41:39AM +0000, Eugene Syromyatnikov wrote:
> On Wed, Jan 31, 2018 at 7:20 AM, Heiko Carstens
> <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> > @@ -85,6 +91,12 @@ The run-time instrumentation facility is available beginning with System z EC12.
> >  Glibc does not provide a wrapper for this system call, use
> >  .BR syscall (2)
> >  to call it.
> > +.PP
> > +Support for signalling was removed with Linux 4.4. With Linux 4.4
> > +also the check if
> > +.IR signum
> > +is a valid real-time signal was removed. For backwards compatibility with old
> > +kernels it is recommended to pass a valid real-time signal number.
> I would recommend passing 0 instead, as passing non-zero signal number
> implies that the userspace process expects to receive this signal in
> the future in case of aforementioned events, and this will not happen
> on Linux 4.4 onwards.

Passing 0 as signum is not backwards compatible, since that will result in
an error with old kernels.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
