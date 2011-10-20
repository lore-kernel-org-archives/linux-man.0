From: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Subject: Re: [PATCH 1/6] ld.so.8: clarify synopsis
Date: Thu, 20 Oct 2011 13:28:39 -0500
Message-ID: <CAOnWdojWj5PYAp7ANX_qmvTJjR9EicSy0yG5LUTumOxQTpmQAQ@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
	<201110201408.34778.vapier@gentoo.org>
	<CAOnWdojdzzvBFnyE9njnZg+RFoaC8V-HGSnhiBhGeY-tQzCiig@mail.gmail.com>
	<201110201426.07094.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201110201426.07094.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 20 October 2011 13:26, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Thursday 20 October 2011 14:17:39 Reuben Thomas wrote:
>> On 20 October 2011 13:08, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> > On Thursday 20 October 2011 03:04:12 Jonathan Nieder wrote:
>> >> +.RB \*(lq /lib/ld-linux.so.*
>> >> +.RI [ options ]
>> >> +.I program
>> >> +.RI [ arguments ]\*(rq.
>> >
>> > can we avoid lq/rq ? =A0it's pretty uncommon and imo, just useless=
 noise.
>>
>> Au contraire, proper quotation marks make man pages more readable; t=
o
>> be encouraged.
>
> sorry, my point was lq/rq vs "", not lq/rq vs nothing ...

In that case I retract my retraction: I'd much rather have curly
quotes. They're more readable and they make it easier to tell when
quotes are part of input/output (in which case they're straight).

--=20
http://rrt.sc3d.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
