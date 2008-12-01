From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Mon, 1 Dec 2008 22:08:39 +0100
Message-ID: <20081201210835.GA14009@ub>
References: <20081126181732.GA1509@us.ibm.com> <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com> <20081201181055.GA12493@us.ibm.com> <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com> <49343E32.50707@zytor.com> <cfd18e0f0812011205w62f30725m53f4b16cea3272aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812011205w62f30725m53f4b16cea3272aa-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, List util-linux-ng <util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Dec 01, 2008 at 03:05:47PM -0500, Michael Kerrisk wrote:
> On Mon, Dec 1, 2008 at 2:42 PM, H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:
> > Add Cc: util-linux-ng
> >
> > Michael Kerrisk wrote:
> >>
> >> The fact that the util-linux(-ng) maintainer includes some kernel
> >> details in the mount(8) man page is not something that I control.
> >> It may or may not be a good idea.
> >>
> >
> > IMNSHO, it's distincly not a good idea.  For one thing, the mount(8) man
> > page is a mess.  Any options that aren't generic across filesystems
> > should be moved out of mount(8) into the filesystem man pages in section 4.
> >
> > The fact that the options are in the mount(8) man page is largely a
> > historical artifact dating back to the early 1990's when Linux only had
> > a handful of filesystems.
> >
> > The way to do that pretty much ends up with:
> >
> > 1. Agree that this is the way to do it.
> > 2. Add the options to section 4.
> > 3. Clean up mount(8).
> >
> > ... in that order.
> 
> If there's consensus (including from the mount(8) man page
> maintainer), I have no objection to this, and I can see some sense in
> it.  The mount options are, after all, kernel interfaces.  Perhaps
> this whole situation arose because once upon a time, the maintainer of
> the mount(8) page and the maintainer of man-pages were the same
> person, Andries, and perhaps he too has an opinion.  (Andries, here's
> a pointer to the thread so far:
> http://article.gmane.org/gmane.linux.man/557/ )

Hi Michael,

At some point in time I cleaned up the messy and incomplete mount docs
and wrote the nicely structured and complete mount(8). Of course as
time passes completeness can be lost, and the page can become unwieldy
because of excessive length. The page I am looking at has roughly 1500
lines, of which roughly 1000 are about filesystem-specific mount options.
Maybe a bit long, but since this length is caused by a list that is
alphabetically sorted and has entries that tend to be only a few dozen
lines long, I do not mind this length so much.

Perhaps Peter complains about something else when he sees a mess?

The goal of a man page author must be convenience of the user.
The information must be clear, precise, concise, easy to find.

I don't know how modern distributions usually present these man pages.
Myself, I read them in the old-fashioned way on an xterm, where no
hyperlinks are available. In such a setting a single page is clearly
more convenient, but there will come a point where it is simply too long.

These filesystem man pages in section 4 do not exist yet, as far as I can see.
What would the names be? Would splitting things up make it easier for the
user to find her info?

Andries

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
