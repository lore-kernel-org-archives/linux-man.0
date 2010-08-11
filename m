From: der Mouse <mouse-QYwwddsQ6tkEPrhfXw3Q4tGeqqvjHH9B@public.gmane.org>
Subject: lseek(2) BSD buglet
Date: Wed, 11 Aug 2010 14:13:35 -0400 (EDT)
Message-ID: <201008111813.OAA03192@Sparkle.Rodents-Montreal.ORG>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

lseek(2) (noticed on 3.23, 3.25 has similar wording) says, in part,

       SVr1-3 returns long instead of off_t, BSD returns int.

While the BSDs are not a single monolithic entity, NetBSD has returned
off_t from lseek(2) since 1.5 at the very latest, meaning late 2000.
I'd be surprised if there's a non-orphaned BSD left that still uses
int.

I'm not sure what wording would be best.  Depends on whether you think
it's worth mentioning the historical practice from the days when BSD
deserved the B in its name or not, I'd say.  Perhaps something like

	..., BSD from Berkeley returned int but modern BSD variants
	have switched to off_t.

or

	..., most (all?) BSDs use off_t.

or some such.

Note, if you want to write back to me for any reason, you will not get
through from gmail (nor hotmail nor yahoo webmail; there seems to be
something about running a big webmailer that's incompatible with
running a civilized shop).  Depending on where you're sending from, you
may get better results from with mouse-S783fYmB3Ccdnm+yROfE0A@public.gmane.org and/or
mouse-N7zJMUF80UksA/PxXw9srA@public.gmane.org - actually, sending to all three might not be a bad
idea.

Of course, if you don't need to write back, that's no issue. :)

/~\ The ASCII				  Mouse
\ / Ribbon Campaign
 X  Against HTML		mouse-NcIlfYlhY41Ekk/fuQG8RGD2FQJk+8+b@public.gmane.org
/ \ Email!	     7D C8 61 52 5D E7 2D 39  4E F1 31 3E E8 B3 27 4B
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
