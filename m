From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC] resolver_r.3: New page documenting res_ninit() et al
Date: Mon, 4 Jul 2011 00:33:31 -0500
Message-ID: <20110704053331.GA16153@elie>
References: <20110704051737.GA15844@elie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110704051737.GA15844@elie>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Martin Ferrari <tincho-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Robert Edmonds <edmonds-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi again,

Jonathan Nieder wrote:

> --- /dev/null
> +++ b/man3/resolver_r.3
> @@ -0,0 +1,136 @@
[...]
> +.B typedef struct state *res_state;

Looking over [1], it occurs to me that treating "res_state" as an
opaque type doesn't work if this API is to be actually usable.  A
typical program will look like this:

	struct __res_state res;

	if (res_ninit(&res))
		die_errno("cannot initialize resolver");
	...

Is "struct __res_state" really supposed to be part of the public
API?  I guess it is.

So I'd suggest squashing in the mini-patch below to reflect that.
Sorry for the noise.

[1] https://lists.isc.org/pipermail/bind-users/2008-July/070847.html

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/resolver_r.3 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/man3/resolver_r.3 b/man3/resolver_r.3
index f2ced438..a70834b4 100644
--- a/man3/resolver_r.3
+++ b/man3/resolver_r.3
@@ -13,7 +13,8 @@ res_nsend \- reentrant resolver routines
 .nf
 .B #include <resolv.h>
 .sp
-.B typedef struct state *res_state;
+.B struct __res_state;
+.B typedef struct __res_state *res_state;
 .sp
 .BI "int res_ninit(res_state " statep ");"
 .sp
-- 
1.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
