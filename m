From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sem_overview(7)
Date: Sun, 29 Aug 2010 07:51:29 +0200
Message-ID: <AANLkTinaJnZSV37a9ma5=ffUSmYbXYW__Ep3c52pgRS8@mail.gmail.com>
References: <AANLkTim8ci2eGeHuijipUWNrl3jVcAX40djPClk1Jc3j@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim8ci2eGeHuijipUWNrl3jVcAX40djPClk1Jc3j-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Bailey <peter.eldridge.bailey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Peter,

On Wed, Jul 14, 2010 at 7:36 PM, Peter Bailey
<peter.eldridge.bailey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I believe I have found a typo in sem_overview(7):
> "e.g., a System V shared memory segment created using=A0semget(2)"
> should be
> "e.g., a System V shared memory segment created using=A0shmget(2)"

Thanks for the report. This error was independently reported and fixed
a couple of months ago.

Cheers,

Michael


> Thanks,
> =A0- Peter Bailey
> --
> Peter Bailey
> Software Engineer
> Steward Observatory
> University of Arizona
> 933 N Cherry Ave
> Tucson, Arizona 85719
> Phone: (651) 538-0340
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
