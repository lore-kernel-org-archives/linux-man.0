From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH] rand.3: Clarify the lowest and highest return values
Date: Sun, 12 Sep 2010 15:45:51 +0100 (BST)
Message-ID: <alpine.LNX.2.01.1009121536080.8648@irtn.ybpnyqbznva>
References: <1284298208-3861-1-git-send-email-mark@pogo.org.uk> <AANLkTimEoUtCYkqK_oTq-W6ExSv5-yoHh9zLee1tMwqK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463793404-942944367-1284302642=:8648"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimEoUtCYkqK_oTq-W6ExSv5-yoHh9zLee1tMwqK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-ID: <alpine.LNX.2.01.1009121544390.8648-x6q/PnJ0WpG13ubhsW4g1g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463793404-942944367-1284302642=:8648
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.LNX.2.01.1009121544391.8648-x6q/PnJ0WpG13ubhsW4g1g@public.gmane.org>

On Sun, 12 Sep 2010, Michael Kerrisk wrote:

> Hi Mark,
>=20
> On Sun, Sep 12, 2010 at 3:30 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> > Commit 7155eb9 gives the range of return values, but the definition
> > of 'range' is unclear. Indicate clearly that RAND_MAX is included in
> > the set of possible return values.
[...]
> > -function returns a pseudo-random integer in
> > -the range [0,\ \fBRAND_MAX\fR].
> > +function returns a pseudo-random integer between 0
> > +and \fBRAND_MAX\fR (inclusive).
> > =A0.PP
> > =A0The
> > =A0.BR srand ()
> > --
> > 1.7.1
>=20
> The "[x..y]" notation in mathematics is used to express an inclusive
> range, so I don't want to eliminate that notation. But I agree that
> not everyone may be aware of this deail. I made the change below.

The notation looks correct, 'closed interval' or 'inclusive interval' may=
=20
be better terminology than 'range', but I'm no mathematician.

Nevertheless, your patch below seems fine and should clear up any=20
misunderstanding.

[...]
> -the range [0,\ \fBRAND_MAX\fR].
> +the range 0 to
> +.BR RAND_MAX
> +inclusive (i.e., the mathematical range [0,\ \fBRAND_MAX\fR]).

--=20
Mark
---1463793404-942944367-1284302642=:8648--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
