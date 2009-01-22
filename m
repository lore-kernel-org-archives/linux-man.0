From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] getifaddrs.3: fix a memory leak in sample code
Date: Fri, 23 Jan 2009 09:09:48 +1300
Message-ID: <cfd18e0f0901221209v605dc0ft8c442111dc7a5230@mail.gmail.com>
References: <1d5458980901200429u43337162ydc8e016c3e8b39d9@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1d5458980901200429u43337162ydc8e016c3e8b39d9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucio Maciel <luciofm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi L=FAcio,

On Wed, Jan 21, 2009 at 1:29 AM, Lucio Maciel <luciofm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hi, there is a memory leak in the sample usage code in the getifaddrs
> (3) man page.
>
> The code doesnt save the head pointer of the list, an then passes a
> NULL pointer to the freeifaddrs(3) leaving all the memory unfreed.

Thanks!  I applied a change fairly similar to your patch for 3.18.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
