From: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Mon, 01 Dec 2008 13:35:32 -0800
Message-ID: <493458A4.3010306@zytor.com>
References: <20081126181732.GA1509@us.ibm.com> <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com> <20081201181055.GA12493@us.ibm.com> <cfd18e0f0812011131g2bbe2d6flb8cc89eaa7f96ad4@mail.gmail.com> <49343E32.50707@zytor.com> <cfd18e0f0812011205w62f30725m53f4b16cea3272aa@mail.gmail.com> <20081201210835.GA14009@ub>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081201210835.GA14009@ub>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, List util-linux-ng <util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andries E. Brouwer wrote:
> 
> Hi Michael,
> 
> At some point in time I cleaned up the messy and incomplete mount docs
> and wrote the nicely structured and complete mount(8). Of course as
> time passes completeness can be lost, and the page can become unwieldy
> because of excessive length. The page I am looking at has roughly 1500
> lines, of which roughly 1000 are about filesystem-specific mount options.
> Maybe a bit long, but since this length is caused by a list that is
> alphabetically sorted and has entries that tend to be only a few dozen
> lines long, I do not mind this length so much.
> 
> Perhaps Peter complains about something else when he sees a mess?
> 

No, but I really don't think it's appropriate to just tag on and on to a
single man page.  I know that I find it incredibly painful to wade
through the long list of options, most of which don't apply to me.

Lists within lists don't visually scan well.

> The goal of a man page author must be convenience of the user.
> The information must be clear, precise, concise, easy to find.
> 
> I don't know how modern distributions usually present these man pages.
> Myself, I read them in the old-fashioned way on an xterm, where no
> hyperlinks are available. In such a setting a single page is clearly
> more convenient, but there will come a point where it is simply too long.
> 
> These filesystem man pages in section 4 do not exist yet, as far as I can see.
> What would the names be? Would splitting things up make it easier for the
> user to find her info?

Some auxilliary filesystems already have section 4, I believe.  The
other option, of course, is to move that data to mount.<filesystem>(8).

	-hpa
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
