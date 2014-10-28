From: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Correct description of null-termination in PR_[GS]ET_NAME
Date: Tue, 28 Oct 2014 15:05:27 +0100
Message-ID: <mvmk33kmgrc.fsf@hawking.suse.de>
References: <mvmr3y1u1t8.fsf@hawking.suse.de> <544F9996.7090906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544F9996.7090906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Tue,
	28 Oct 2014 14:26:46 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> I added here:
>
>   (If the length of the string, including the terminating null byte,
>   exceeds 16 bytes, the string is silently truncated.)
>
> Okay?

Ok.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab-l3A5Bk7waGM@public.gmane.org
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
