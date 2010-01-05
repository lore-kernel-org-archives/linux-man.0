From: Justin T Pryzby <justinp-sqUMWyTXAylY7ZOgVWywrQ@public.gmane.org>
Subject: Re: possibly a Bug in proc man page
Date: Tue, 5 Jan 2010 09:45:23 -0700
Message-ID: <20100105164523.GA8277@norchemlab.com>
References: <9b0a5b991001010142w12fe5259v5819b925d13f352c@mail.gmail.com>
 <cfd18e0f1001050831n37787505y2d05d37aca2cbaa4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f1001050831n37787505y2d05d37aca2cbaa4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Siddu <siddu.sjce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 06, 2010 at 05:31:53AM +1300, Michael Kerrisk wrote:
> Siddu,
> 
> On Fri, Jan 1, 2010 at 10:42 PM, Siddu <siddu.sjce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hello folks
> >
> >
> > The format in /proc/<pid>/maps seems to be updated.  In the man page,
> > for every mapped library it lists only two section while in reality there
> > are three sections like shown below
> 
> I don't understand what yo mean here. Can you please say more.
In his example, libc was listed three times, but in proc(5) libc is
listed only twice.

Justin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
