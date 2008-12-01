From: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Tue, 2 Dec 2008 00:00:31 +0100
Message-ID: <20081201230031.GA26838@nb.net.home>
References: <20081126181732.GA1509@us.ibm.com> <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com> <20081201181055.GA12493@us.ibm.com> <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com> <49343E32.50707@zytor.com> <20081201223913.GF2956@nb.net.home> <4934682F.7050305@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4934682F.7050305-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, List util-linux-ng <util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Dec 01, 2008 at 02:41:51PM -0800, H. Peter Anvin wrote:
> Karel Zak wrote:
> > 
> >> 1. Agree that this is the way to do it.
> >> 2. Add the options to section 4.
> >> 3. Clean up mount(8).
> > 
> >   4. found a way how maintain and keep the man pages up to date.
> > 
> 
> As far as 4. is concerned -- I personally think that keeping man pages
> that directly describe kernel interfaces (e.g. section 2, and parts of
> 4, 5, and 7) in the kernel git tree is the most logical option.

 That's exactly my opinion ... somewhere in Documentation/ and
 maintained *together* with fs-depend code.

    Karel


-- 
 Karel Zak  <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
