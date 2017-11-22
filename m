From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/1] s390_sthyi.2: New page for s390-specific s390_sthyi(2)
Date: Wed, 22 Nov 2017 15:19:47 +0100
Message-ID: <CAKgNAkgNAO3u-JLU3e9qipRNSYyDMF39sJTPZ39dHrhRyYtvnw@mail.gmail.com>
References: <20171122065408.40841-1-haoqf@linux.vnet.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171122065408.40841-1-haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello QingFeng,

> +.SH RETURN VALUE
> +On success, the return value of
> +.BR s390_sthyi ()
> +matches the condition code of the STHYI instructions, which is a value
> +between 0-3 (that is: emulation succeeded).
> +Return value of 0 indicates that CPU capacity information is stored to
> +.I buffer.
> +Return value of 3 indicates "unsupported function code" and buffer's
> +content is unchanged.

Another question. What about the return values 1 and 2? Can they
occur? If yes, we should explain them. If they are reserved for future
use, we should say that.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
