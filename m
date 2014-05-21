From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: Re: [PATCH 21/24] tsearch.3: Fix prototype
Date: Wed, 21 May 2014 22:02:14 +0200
Message-ID: <87oayqew8p.fsf@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
	<1400684275-20972-22-git-send-email-rv@rasmusvillemoes.dk>
	<537CF50D.2080400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537CF50D.2080400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Wed,
	21 May 2014 20:48:45 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi Rasmus,
>
> On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
>> The rootp argument to tfind is void *const void*, not const void **.
>
> Applied, but in the changelog, I guess you meant to write
>
>     The rootp argument to tfind is void *const *, not const void **
>
> Right?

Of course. Thanks for the careful proofreading.

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
