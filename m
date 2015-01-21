From: Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
Subject: Re: fcntl(2) man page patch for OFD locks
Date: Wed, 21 Jan 2015 13:17:59 -0500
Message-ID: <20150121131759.205da51e@tlielax.poochiereds.net>
References: <CAKgNAkhCrh1YYkrqb3E4r=iZcJchcLrz3Sdix2SC05T-62oRiw@mail.gmail.com>
	<20150121124728.350b7e4f@tlielax.poochiereds.net>
	<CAKgNAkjYYoNbA=_XxDLF-EwVYiBhoZ-NQ+s_1-FU9cvT+arWJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjYYoNbA=_XxDLF-EwVYiBhoZ-NQ+s_1-FU9cvT+arWJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 21 Jan 2015 19:16:04 +0100
"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Jeff,
> 
> On 21 January 2015 at 18:47, Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org> wrote:
> > On Wed, 21 Jan 2015 18:44:41 +0100
> > "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> Hi Jeff,
> >>
> >> I was recently checking some details of the man page for OFD locks,
> >> and realized that one paragraph is somewhat misleading:
> >>
> >>        Open file description  locks  always  conflict  with  traditional
> >>        record  locks, even when they are acquired by the same process on
> >>        the same file descriptor.
> >>
> >> This doesn't capture the full story, as far as I can tell. In
> >> particular if we have two processes that take locks on the same region
> >> of a file as follows:
> >>
> >> F_OFD_SETLK F_RDLCK
> >> and
> >> F_SETLK F_RDLCK
> >>
> >> then those pair of locks are compatible. I assume that's expected
> >> behavior, right? I've drafted the patch below for the man page. Seem
> >> okay?
> >>
> >> Cheers,
> >>
> >> Michael
> >>
> >> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> >> index 59f22ce..03c2ae8 100644
> >> --- a/man2/fcntl.2
> >> +++ b/man2/fcntl.2
> >> @@ -495,7 +495,10 @@ and are only automatically released on the last close
> >>  of the open file description,
> >>  instead of being released on any close of the file.
> >>  .PP
> >> -Open file description locks always conflict with traditional record locks,
> >> +Conflicting lock combinations
> >> +(i.e., a read lock and a write lock or two write locks)
> >> +where one lock is an open file description lock and the other
> >> +is a traditional record lock conflict
> >>  even when they are acquired by the same process on the same file descriptor.
> >>
> >>  Open file description locks placed via the same open file description
> >>
> >>
> >
> > Yes, that is expected behavior and your patch looks good to me.
> >
> > Acked-by: Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
> 
> Thanks for the fast response!! It's a shame not to see you around the
> mailing lists no more (at least not the ones I frequent).
> 
> Best regards,
> 
> Michael
> 

No problem. I'm still around, but have been working on some other
things (not so closely tied to userland interfaces). :)

-- 
Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
