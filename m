From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix ppoll example
Date: Thu, 1 Jul 2010 23:49:47 +0200
Message-ID: <AANLkTimkwPS5_6yltbKsCFf-HeVVF5Ox1elT9R1rMcN-@mail.gmail.com>
References: <20091227004007.GA8638@basil.fritz.box>
	<20091227004422.GA8673@basil.fritz.box>
	<AANLkTimHnSfMtcsuG8lJ-MTLeMCA3f9XQkL26bEdth1F@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimHnSfMtcsuG8lJ-MTLeMCA3f9XQkL26bEdth1F-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2010/6/12 Michael Kerrisk wrote:
[...]
> --- a/man2/poll.2
> +++ b/man2/poll.2
[...]
> @@ -304,13 +304,15 @@ is Linux-specific.
> =C2=A0Some implementations define the nonstandard constant
> =C2=A0.B INFTIM
> =C2=A0with the value \-1 for use as a
> -.IR timeout .
> +.IR timeout
> +for
> +.BR poll ()..

Hi Michael,

There is a spurious trailing dot.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
