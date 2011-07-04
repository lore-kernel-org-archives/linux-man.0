From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC] resolver_r.3: New page documenting res_ninit() et al
Date: Mon, 4 Jul 2011 12:19:21 +0300
Message-ID: <CACKs7VCC_gkVEeci+ctTQ-H+YPsErN9cWb-CczvVUW5pG3zmDw@mail.gmail.com>
References: <20110704051737.GA15844@elie>
	<20110704053331.GA16153@elie>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110704053331.GA16153@elie>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Martin Ferrari <tincho-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Robert Edmonds <edmonds-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

IIRC bind 8 (or libbind) also comes with its own manpages. Ages ago I
stole the info from their resolver.3 page and merged it with the page
distributed with glibc (the current version is taken from there as
well, IIRC). The patch got somehow lost through the cracks, I think...

Or do you see any licensing issues with doing that?

OTOH, if you want to keep your approach and add another page for the
reentrant functions, you might want to add a pointer in resolver.3 so
people know there's another page as well :).

Just my 2 cents,
Stefan.

On Mon, Jul 4, 2011 at 8:33 AM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> Hi again,
>
> Jonathan Nieder wrote:
>
>> --- /dev/null
>> +++ b/man3/resolver_r.3
>> @@ -0,0 +1,136 @@
> [...]
>> +.B typedef struct state *res_state;
>
> Looking over [1], it occurs to me that treating "res_state" as an
> opaque type doesn't work if this API is to be actually usable. =A0A
> typical program will look like this:
>
> =A0 =A0 =A0 =A0struct __res_state res;
>
> =A0 =A0 =A0 =A0if (res_ninit(&res))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0die_errno("cannot initialize resolver"=
);
> =A0 =A0 =A0 =A0...
>
> Is "struct __res_state" really supposed to be part of the public
> API? =A0I guess it is.
>
> So I'd suggest squashing in the mini-patch below to reflect that.
> Sorry for the noise.
>
> [1] https://lists.isc.org/pipermail/bind-users/2008-July/070847.html
>
> Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/resolver_r.3 | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/man3/resolver_r.3 b/man3/resolver_r.3
> index f2ced438..a70834b4 100644
> --- a/man3/resolver_r.3
> +++ b/man3/resolver_r.3
> @@ -13,7 +13,8 @@ res_nsend \- reentrant resolver routines
> =A0.nf
> =A0.B #include <resolv.h>
> =A0.sp
> -.B typedef struct state *res_state;
> +.B struct __res_state;
> +.B typedef struct __res_state *res_state;
> =A0.sp
> =A0.BI "int res_ninit(res_state " statep ");"
> =A0.sp
> --
> 1.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
