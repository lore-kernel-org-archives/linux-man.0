From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Mon, 1 Dec 2008 15:05:47 -0500
Message-ID: <cfd18e0f0812011205w62f30725m53f4b16cea3272aa@mail.gmail.com>
References: <20081126181732.GA1509@us.ibm.com>
	 <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com>
	 <20081201181055.GA12493@us.ibm.com>
	 <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com>
	 <49343E32.50707@zytor.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49343E32.50707-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: List util-linux-ng <util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Dec 1, 2008 at 2:42 PM, H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org> wrote:
> Add Cc: util-linux-ng
>
> Michael Kerrisk wrote:
>>
>> The fact that the util-linux(-ng) maintainer includes some kernel
>> details in the mount(8) man page is not something that I control.  It
>> may or may not be a good idea.
>>
>
> IMNSHO, it's distincly not a good idea.  For one thing, the mount(8) man
> page is a mess.  Any options that aren't generic across filesystems
> should be moved out of mount(8) into the filesystem man pages in section 4.
>
> The fact that the options are in the mount(8) man page is largely a
> historical artifact dating back to the early 1990's when Linux only had
> a handful of filesystems.
>
> The way to do that pretty much ends up with:
>
> 1. Agree that this is the way to do it.
> 2. Add the options to section 4.
> 3. Clean up mount(8).
>
> ... in that order.

If there's consensus (including from the mount(8) man page
maintainer), I have no objection to this, and I can see some sense in
it.  The mount options are, after all, kernel interfaces.  Perhaps
this whole situation arose because once upon a time, the maintainer of
the mount(8) page and the maintainer of man-pages were the same
person, Andries, and perhaps he too has an opinion.  (Andries, here's
a pointer to the thread so far:
http://article.gmane.org/gmane.linux.man/557/ )

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
