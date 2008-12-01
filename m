From: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Mon, 1 Dec 2008 23:39:13 +0100
Message-ID: <20081201223913.GF2956@nb.net.home>
References: <20081126181732.GA1509@us.ibm.com> <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com> <20081201181055.GA12493@us.ibm.com> <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com> <49343E32.50707@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49343E32.50707-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, List util-linux-ng <util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Dec 01, 2008 at 11:42:42AM -0800, H. Peter Anvin wrote:
> Add Cc: util-linux-ng
> 
> Michael Kerrisk wrote:
> > 
> > The fact that the util-linux(-ng) maintainer includes some kernel
> > details in the mount(8) man page is not something that I control.  It
> > may or may not be a good idea.

 Send a patch or bug report, that's the way how you can "control" :-)

> IMNSHO, it's distincly not a good idea.  For one thing, the mount(8) man
> page is a mess.  Any options that aren't generic across filesystems
> should be moved out of mount(8) into the filesystem man pages in section 4.

 We're already talking about it at linux-fsdevel and util-linux-ng
 mailing list:

    http://marc.info/?l=linux-fsdevel&m=122767297002093&w=3

> The fact that the options are in the mount(8) man page is largely a
> historical artifact dating back to the early 1990's when Linux only had
> a handful of filesystems.

 Yes, I haven't time to cleanup util-linux-ng docs (yet). The idea to
 create man page (in section 4) for every filesystem is my wish. So..
 I look forward to see some patches in this area.

> 1. Agree that this is the way to do it.
> 2. Add the options to section 4.
> 3. Clean up mount(8).

  4. found a way how maintain and keep the man pages up to date.

    Karel

-- 
 Karel Zak  <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
