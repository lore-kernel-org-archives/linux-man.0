From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2 Updated timeout documentation
Date: Sun, 23 Dec 2012 19:30:50 +0100
Message-ID: <CAKgNAkhFS_n4BrTvqV12VcLSPXGjkBE6MOFS-sUCnCT8y7Pjfw@mail.gmail.com>
References: <CAKgNAkhz1E8c2jpECcYrKJyMv1RB36qC_HjW9s=i=+bYLfii4w@mail.gmail.com>
 <1356264415-5108-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356264415-5108-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Elie,

> In any case, when operating in non-blocking mode, the timeout is taken into
> account, which could mean that recvmmsg() returns while data is still
> available (which was not clearly stated). (Combination of much data to
> copy and a very sharp timeout).

Can you say more about what you see/understand with nonblocking mode.
I don't understand what you mean here (and it doesn't fit with what I
am seeing on testing). Nonblocking mode should, I believe, always mean
an immediate return, regardless of any timeout.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
