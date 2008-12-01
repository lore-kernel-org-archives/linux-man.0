From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Mon, 1 Dec 2008 14:31:06 -0500
Message-ID: <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com>
References: <20081126181732.GA1509@us.ibm.com>
	 <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com>
	 <20081201181055.GA12493@us.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081201181055.GA12493-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Suka,

On Mon, Dec 1, 2008 at 1:10 PM, Sukadev Bhattiprolu
<sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> Michael Kerrisk [mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org] wrote:
> | Suka,
> |
> | On Wed, Nov 26, 2008 at 1:17 PM, Sukadev Bhattiprolu
> | <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> | > Michael,
> | >
> | > Following is some text that would need to be added to devpts section of
> | > mount(8) man page (its not a formal patch, just the text to be added).
> | > I am looking for logistics and a general review of the text to be added.
> |
> | The mount(8) page is not part of the man-pages set.  Take a look here:
> | http://www.kernel.org/doc/man-pages/man_pages_other.html
>
> Aah, so maybe different patches for different distros.

No, no...  The point is that mount(8) is part of a different project:
util-linux(-ng).  Your patches potentially need to go to the
maintainer of *that* project.

> I will try to
> send them out at least to Redhat/Suse/Ubuntu. But cannot help asking
> (curiousity/ignorance :-), why are there separate 'trees' for different
> man pages even for features included in kernel ?

The fact that the util-linux(-ng) maintainer includes some kernel
details in the mount(8) man page is not something that I control.  It
may or may not be a good idea.

> | > The relevant kernel patches are currently in ttydev/linux-next trees.
> | > I can send the formal man page patch after those patches go into mainline.
> |
> | Though mount(8) is not on my set, I wonder if there is any text that
> | should perhaps be added to pts(4) or pty(7).
> |
> | http://www.kernel.org/doc/man-pages/online/pages/man4/pts.4.html
> | http://www.kernel.org/doc/man-pages/online/pages/man7/pty.7.html
>
> I think no updates are needed for pty(7).  I was thinking of adding a
> pointer in pts(4) to mount(8), but do the sets of man pages also have
> separate release-cycles ?

Most certainly.  The point is: all Linux man pages do *not* come from
the same source.  The package I maintain consists mainly of pages in
Sections 2, 3, 4, 5, and 7.

> If so, should I stage the patches such that
> kernel patches go in first, mount(8) updates next and pts(4) updates
> last ?

Well, You'd need to talk with the util-linux-ng people, but I think in
the end the order doesn't matter too much.  It's typically only a few
months later that man-pages will end in a distro release anyway..

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
