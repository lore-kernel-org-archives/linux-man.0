From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] getline(3) was added to POSIX 2008
Date: Thu, 05 Nov 2009 13:07:25 +0100
Message-ID: <87fx8t89aa.fsf@basil.nowhere.org>
References: <1257370830-12899-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1257370830-12899-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> (Mike Frysinger's message of "Wed,  4 Nov 2009 16:40:30 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <public-vapier-aBrp7R+bbdUdnm+yROfE0A-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>
Cc: Michael Kerrisk <public-mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, public-linux-man-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: linux-man@vger.kernel.org



Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> writes:

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> ---
>  man3/getline.3 |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/man3/getline.3 b/man3/getline.3
> index 2687809..622b5c8 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -26,7 +26,6 @@
>  getline, getdelim \- delimited string input
>  .SH SYNOPSIS
>  .nf
> -.B #define _GNU_SOURCE
>  .B #include <stdio.h>

Dropping the symbol wouldn't work on any older libc.

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
