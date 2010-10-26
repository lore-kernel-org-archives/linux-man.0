From: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: subpage_prot() man page
Date: Wed, 27 Oct 2010 10:01:44 +1100
Message-ID: <20101026230144.GA30272@brick.ozlabs.ibm.com>
References: <AANLkTi=GZ5hxhbG7Frak-Hb+PC8=4uXcnBEgpcbCrmPG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=GZ5hxhbG7Frak-Hb+PC8=4uXcnBEgpcbCrmPG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Oct 10, 2010 at 07:53:35AM +0200, Michael Kerrisk wrote:

> Paul, would you be willing to review this page for the system call
> that you added?

Thanks for doing this.  It looks fine, with just a couple of small
comments:

> .SH RETURN VALUE
> On success,
> .BR subpage_prot ()
> returns 0.
> Otherwise, one of the negated =A0error codes specified below is retur=
ned.

Actually, by the time it gets back out to userland, it follows the
usual convention for error codes on PowerPC: for an error, the
positive error code is returned (in r3) with the CR0.SO bit (bit 3 in
the condition code register) set to indicate error.  CR0.S0 is cleared
if there is no error.

So I would just remove the word "negated".

> .\" Perhaps we don't need to document this implementation detail:
> .\"
> .\" Implicit in this is that the regions of the address space that ar=
e
> .\" protected are switched to use 4k hardware pages rather than 64k
> .\" hardware pages (on machines with hardware 64k page support).
> .\" In fact the whole process is switched to use 4k hardware pages wh=
en the
> .\" subpage_prot system call is used, but this could be improved in f=
uture
> .\" to switch only the affected segments.

I'm pretty sure we now only switch the affected segment, not the whole
process.

Paul.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
