From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH 1/4] io_cancel.2: fix up the description
Date: Thu, 11 Apr 2013 12:14:30 +0200
Message-ID: <20130411101430.GA1325@rei.scz.novell.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
 <1365104218-26042-2-git-send-email-jmoyer@redhat.com>
 <CAKgNAki66jwQvKGLDWRomG0-s29EP34MZCoU=eUjHnQsn3x8wA@mail.gmail.com>
 <20130410111422.GB1376@rei.scz.novell.com>
 <x49ppy2jxkm.fsf@segfault.boston.devel.redhat.com>
 <CAKgNAkg0wv=XO7UwpnafE98HNMZrA=jZh4fN+m7UmijwUaroJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkg0wv=XO7UwpnafE98HNMZrA=jZh4fN+m7UmijwUaroJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi!
> >> It is no big deal but I think that the sentence could be a little clearer
> >> with explicitly stating that the ctx_id is aio context and the iocb
> >> describes the operation to be canceled. Something like:
> >>
> >> The
> >> .I iocb
> >> describes the operation to be canceled and the
> >> .I ctx_id
> >> is aio context the operation was submitted to.
> >
> > I agree that this is better.  Thanks Cyril!
> 
> 
> So, in the end, I have
> 
>        The  iocb  argument  describes the operation to be canceled
>        and the ctx_id argument is the AIO  context  to  which  the
>        operation  was submitted.
> 
> Okay?

Okay with me.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
