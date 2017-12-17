From: Elie Roudninski <xademax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: Missing { in sigaltstack example code
Date: Sun, 17 Dec 2017 18:55:36 +0100
Message-ID: <CAJJ5katC1h_cpoZRuzUNybeaD+3FBxjFtK9v7GFXCms7kd3bYQ@mail.gmail.com>
References: <CAJJ5kavLdD33orcz4fDHcBwAM_T0RD8Xaja78vdBe2x8=wHbKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJJ5kavLdD33orcz4fDHcBwAM_T0RD8Xaja78vdBe2x8=wHbKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

I noticed a small typo in the man page of sigaltstack in the example
section, a { is missing :
http://man7.org/linux/man-pages/man2/sigaltstack.2.html

I believe :

> if (sigaltstack(&ss, NULL) == -1)
>     perror("sigaltstack");
>     exit(EXIT_FAILURE);
> }

should be :

> if (sigaltstack(&ss, NULL) == -1) {
>     perror("sigaltstack");
>     exit(EXIT_FAILURE);
> }

See you next year, and thank you for maintaining the manpages :)

Best regards,

Elie ROUDNINSKI

P.S : sorry for previous email with HTML ...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
